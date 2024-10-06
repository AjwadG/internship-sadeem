package controllers

import (
	"fmt"
	"internship-project/models"
	"internship-project/utils"
	"log"
	"net/http"
	"strings"
	"time"

	"github.com/Masterminds/squirrel"
)

func MeHandler(w http.ResponseWriter, r *http.Request) {
	userID := r.Context().Value(utils.UserIDKey).(string)
	var user models.User

	query, args, err := QB.Select(strings.Join(user_columns, ", ")).From("users").Where("id = ?", userID).ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	if err := db.Get(&user, query, args...); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	if err := user.GetRoles(); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	utils.SendJSONResponse(w, http.StatusOK, user)
}

func UpdateMeHandler(w http.ResponseWriter, r *http.Request) {
	id := r.Context().Value(utils.UserIDKey).(string)
	var user models.User
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
