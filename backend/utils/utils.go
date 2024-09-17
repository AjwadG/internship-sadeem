package utils

import (
	"context"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"time"

	"github.com/golang-jwt/jwt/v5"
	"github.com/google/uuid"
	"golang.org/x/crypto/bcrypt"
	"golang.org/x/exp/rand"
)

var (
	Domain = os.Getenv("DOMAIN")

	jwtSecret = []byte(os.Getenv("JWT_SECRET"))
)

func SendJSONResponse(w http.ResponseWriter, status int, data interface{}) {
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(status)
	json.NewEncoder(w).Encode(data)
}

func HandleError(w http.ResponseWriter, status int, message string) {
	SendJSONResponse(w, status, map[string]string{
		"error": message,
	})
}

// SaveImageFile saves the uploaded image file to a specified directory with a new name
func SaveImageFile(file io.Reader, table string, filename string) (string, error) {
	// Create directory structure if it doesn't exist
	fullPath := filepath.Join("uploads", table)
	if err := os.MkdirAll(fullPath, os.ModePerm); err != nil {
		return "", err
	}

	// Generate new filename
	randomNumber := rand.Intn(1000)
	timestamp := time.Now().Unix()
	ext := filepath.Ext(filename)
	newFileName := fmt.Sprintf("%s_%d_%d%s", filepath.Base(table), timestamp, randomNumber, ext)
	newFilePath := filepath.Join(fullPath, newFileName)

	// Save the file
	destFile, err := os.Create(newFilePath)
	if err != nil {
		return "", err
	}
	defer destFile.Close()

	if _, err := io.Copy(destFile, file); err != nil {
		return "", err
	}

	// Return the full path including directory
	return newFilePath, nil
}

func HashPassword(password string) (string, error) {
	hashPassword, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)
	if err != nil {
		return "", err
	}
	return string(hashPassword), nil
}

func CheckPasswordHash(password string, hash string) bool {
	err := bcrypt.CompareHashAndPassword([]byte(hash), []byte(password))
	return err == nil
}

func DeleteImageFile(filePath string) error {
	// Remove the file
	if err := os.Remove(strings.TrimPrefix(filePath, Domain+"/")); err != nil {
		return err
	}
	return nil
}

func GenerateToken(userId uuid.UUID) (string, error) {
	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"exp":    time.Now().Add(time.Hour * 24).Unix(),
		"iat":    time.Now().Unix(),
		"userID": userId,
	})

	tokenString, err := token.SignedString(jwtSecret)
	if err != nil {
		return "", err
	}

	return tokenString, nil
}

type contextKey string

const UserIDKey = contextKey("userID")

func ValdiateToken(next http.HandlerFunc) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		tokenString := r.Header.Get("Authorization")
		if tokenString == "" {
			HandleError(w, http.StatusUnauthorized, "Missing Authorization header")
			return
		}

		if strings.HasPrefix(tokenString, "Bearer ") {
			tokenString = strings.TrimPrefix(tokenString, "Bearer ")
		} else {
			HandleError(w, http.StatusUnauthorized, "Invalid Authorization header")
			return
		}

		token, err := jwt.Parse(tokenString, func(token *jwt.Token) (interface{}, error) {
			if _, ok := token.Method.(*jwt.SigningMethodHMAC); !ok {
				return nil, fmt.Errorf("unexpected signing method: %v", token.Header["alg"])
			}
			return jwtSecret, nil
		})

		if err != nil || !token.Valid {
			HandleError(w, http.StatusUnauthorized, "Invalid token")
			return
		}

		// Extract userID from token claims
		if claims, ok := token.Claims.(jwt.MapClaims); ok && token.Valid {
			userID := claims["userID"].(string)
			// Add userID to the context
			ctx := context.WithValue(r.Context(), UserIDKey, userID)
			r = r.WithContext(ctx)
		} else {
			HandleError(w, http.StatusUnauthorized, "Invalid token claims")
			return
		}

		next(w, r)
	}
}

func CORS(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		w.Header().Set("Access-Control-Allow-Origin", "*") // Allow all origins
		w.Header().Set("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")
		w.Header().Set("Access-Control-Allow-Headers", "Content-Type, Authorization")

		// Handle preflight OPTIONS request
		if r.Method == "OPTIONS" {
			w.WriteHeader(http.StatusOK)
			return
		}
		next.ServeHTTP(w, r)
	})
}
