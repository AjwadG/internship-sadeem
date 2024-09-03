package controllers

import (
	"fmt"
	"internship-project/models"
	"internship-project/utils"
	"log"
	"net/http"
	"os"
	"strings"
	"time"

	"github.com/Masterminds/squirrel"
	"github.com/jmoiron/sqlx"
	_ "github.com/joho/godotenv/autoload"
)

var (
	db *sqlx.DB
	QB = squirrel.StatementBuilder.PlaceholderFormat(squirrel.Dollar)
)

func SetDB(database *sqlx.DB) {
	db = database
}

var (
	Domain = os.Getenv("DOMAIN")

	user_columns = []string{
		"id",
		"name",
		"email",
		"phone",
		"created_at",
		"updated_at",
		fmt.Sprintf("CASE WHEN NULLIF(img, '') IS NOT NULL THEN FORMAT('%s/%%s', img) ELSE NULL END AS img", Domain),
	}
)

func IndexUserHandler(w http.ResponseWriter, r *http.Request) {
	var users []models.User

	query, args, err := QB.Select(strings.Join(user_columns, ", ")).
		From("users").
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	if err := db.Select(&users, query, args...); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	utils.SendJSONResponse(w, http.StatusOK, users)
}

func ShowUserHandler(w http.ResponseWriter, r *http.Request) {
	var user models.User
	id := r.PathValue("id")
	query, args, err := QB.Select(strings.Join(user_columns, ", ")).
		From("users").
		Where("id = ?", id).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	if err := db.Get(&user, query, args...); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	utils.SendJSONResponse(w, http.StatusOK, user)
}

func UpdateUserHandler(w http.ResponseWriter, r *http.Request) {
	var user models.User
	id := r.PathValue("id")
	query, args, err := QB.Select(user_columns...).
		From("users").
		Where("id = ?", id).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	if err := db.Get(&user, query, args...); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	// update user
	if r.FormValue("name") != "" {
		user.Name = r.FormValue("name")
	}
	if r.FormValue("phone") != "" {
		user.Phone = r.FormValue("phone")
	}
	if r.FormValue("email") != "" {
		user.Email = r.FormValue("email")
	}
	if r.FormValue("password") != "" {
		hashedPassword, err := utils.HashPassword(user.Password)
		if err != nil {
			utils.HandleError(w, http.StatusInternalServerError, "Error hashing password")
			return
		}
		user.Password = hashedPassword
	}
	var oldImg *string
	var newImg *string
	// Handle image file upload
	file, fileHeader, err := r.FormFile("img")
	if err != nil && err != http.ErrMissingFile {
		utils.HandleError(w, http.StatusBadRequest, "Error retrieving file: "+err.Error())
		return
	} else if err == nil {
		defer file.Close()
		if user.Img != nil {
			oldImg = user.Img
		}
		imageName, err := utils.SaveImageFile(file, "users", fileHeader.Filename)
		if err != nil {
			utils.HandleError(w, http.StatusInternalServerError, "Error saving image file: "+err.Error())
			return
		}
		user.Img = &imageName
		newImg = &imageName
	}
	if user.Img != nil {
		*user.Img = strings.TrimPrefix(*user.Img, utils.Domain+"/")
	}

	query, args, err = QB.
		Update("users").
		Set("img", user.Img).
		Set("name", user.Name).
		Set("email", user.Email).
		Set("phone", user.Phone).
		Set("password", user.Password).
		Set("updated_at", time.Now()).
		Where(squirrel.Eq{"id": user.ID}).
		Suffix(fmt.Sprintf("RETURNING %s", strings.Join(user_columns, ", "))).
		ToSql()
	if err != nil {
		utils.DeleteImageFile(*newImg)
		utils.HandleError(w, http.StatusInternalServerError, "Error building query")
		return
	}

	if err := db.QueryRowx(query, args...).StructScan(&user); err != nil {
		utils.DeleteImageFile(*newImg)
		utils.HandleError(w, http.StatusInternalServerError, "Error creating user"+err.Error())
		return
	}

	if oldImg != nil {
		if err := utils.DeleteImageFile(*oldImg); err != nil {
			log.Println(err)
		}
	}

	utils.SendJSONResponse(w, http.StatusOK, user)
}

func DeleteUserHandler(w http.ResponseWriter, r *http.Request) {
	id := r.PathValue("id")
	// Use QB to build the delete query
	query, args, err := QB.Delete("users").
		Where("id = ?", id).
		Suffix("RETURNING img").
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, "Error building query: "+err.Error())
		return
	}

	var img *string
	if err := db.QueryRow(query, args...).Scan(&img); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, "Error deleting user: "+err.Error())
		return
	}
	// If the user has an image, delete it
	if img != nil {
		if err := utils.DeleteImageFile(*img); err != nil {
			log.Println(err)
		}
	}

	w.WriteHeader(http.StatusNoContent)
}

func GrantRoleHandler(w http.ResponseWriter, r *http.Request) {

	var role []models.Role

	user_id := r.FormValue("user_id")
	role_id := r.FormValue("role_id")

	if user_id == "" || role_id == "" {
		utils.HandleError(w, http.StatusBadRequest, "Missing required parameters")
		return
	}

	query, args, err := QB.Select("*").From("roles").Where("id = ?", role_id).ToSql()

	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	if err := db.Select(&role, query, args...); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	if len(role) == 0 {
		utils.HandleError(w, http.StatusNotFound, "Role not found")
		return
	}

	query, args, err = QB.Insert("user_roles").Columns("user_id", "role_id").Values(user_id, role_id).ToSql()

	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	if _, err := db.Exec(query, args...); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, "role already granted")
		return
	}

	utils.SendJSONResponse(w, http.StatusOK, "Role granted successfully")
}

func RevokeRoleHandler(w http.ResponseWriter, r *http.Request) {

	user_id := r.FormValue("user_id")
	role_id := r.FormValue("role_id")

	if user_id == "" || role_id == "" {
		utils.HandleError(w, http.StatusBadRequest, "Missing required parameters")
		return
	}

	query, args, err := QB.Delete("user_roles").Where("user_id = ? AND role_id = ?", user_id, role_id).ToSql()

	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	a, err := db.Exec(query, args...)
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	n, err := a.RowsAffected()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	if n == 0 {
		utils.HandleError(w, http.StatusNotFound, "Role not granted for user")
		return
	}

	utils.SendJSONResponse(w, http.StatusOK, "Role revoked successfully")
}
