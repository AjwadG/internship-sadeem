package controllers

import (
	"fmt"
	"internship-project/models"
	"internship-project/utils"
	"net/http"
	"strings"

	"github.com/google/uuid"
)

func SignUpHandler(w http.ResponseWriter, r *http.Request) {
	user := models.User{
		ID:       uuid.New(),
		Name:     r.FormValue("name"),
		Phone:    r.FormValue("phone"),
		Email:    r.FormValue("email"),
		Password: r.FormValue("password"),
	}
	if user.Password == "" {
		utils.HandleError(w, http.StatusBadRequest, "Password is required")
		return
	}

	file, fileHeader, err := r.FormFile("img")
	if err != nil && err != http.ErrMissingFile {
		utils.HandleError(w, http.StatusBadRequest, "Invalid file")
		return
	} else if err == nil {
		defer file.Close()
		imageName, err := utils.SaveImageFile(file, "users", fileHeader.Filename)
		if err != nil {
			utils.HandleError(w, http.StatusInternalServerError, "Error saving image")
		}
		user.Img = &imageName
	}

	hashedPassword, err := utils.HashPassword(user.Password)
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, "Error hashing password")
		return
	}
	user.Password = hashedPassword

	query, args, err := QB.
		Insert("users").
		Columns("id", "img", "name", "phone", "email", "password").
		Values(user.ID, user.Img, user.Name, user.Phone, user.Email, user.Password).
		Suffix(fmt.Sprintf("RETURNING %s", strings.Join(user_columns, ", "))).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, "Error generate query")
		return
	}

	if err := db.QueryRowx(query, args...).StructScan(&user); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, "Error creating user"+err.Error())
		return
	}

	query, args, err = QB.Insert("user_roles").Columns("user_id", "role_id").Values(user.ID, 3).ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, "Error generate query")
		return
	}

	if _, err := db.Exec(query, args...); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, "Error granting role"+err.Error())
		return
	}

	utils.SendJSONResponse(w, http.StatusCreated, user)
}

func LoginHandler(w http.ResponseWriter, r *http.Request) {
	email := r.FormValue("email")
	password := r.FormValue("password")
	if email == "" || password == "" {
		utils.HandleError(w, http.StatusBadRequest, "Email and password are required")
		return
	}
	var user models.User
	query, args, err := QB.Select("*").
		From("users").
		Where("email = ?", email).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, "Error generate query")
		return
	}
	if err := db.Get(&user, query, args...); err != nil {
		utils.HandleError(w, http.StatusUnauthorized, "Invalid email or password")
		return
	}
	if !utils.CheckPasswordHash(password, user.Password) {
		utils.HandleError(w, http.StatusUnauthorized, "Invalid email or password")
		return
	}

	token, err := utils.GenerateToken(user.ID)
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, "Error generating token")
		return
	}

	utils.SendJSONResponse(w, http.StatusOK, map[string]string{"token": token})
}
