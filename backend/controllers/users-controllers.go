package controllers

import (
	"fmt"
	"internship-project/utils"
	"net/http"
	"strconv"

	"github.com/google/uuid"
	"github.com/jmoiron/sqlx"
)

var db *sqlx.DB

type User struct {
	ID    int    `db:"id" json:"id"`
	Name  string `db:"name" json:"name"`
	Email string `db:"email" json:"email"`
}
type NewUser struct {
	ID    uuid.UUID `db:"id" json:"id"`
	Name  string    `db:"name" json:"name"`
	Email string    `db:"email" json:"email"`
}

func SetDB(database *sqlx.DB) {
	db = database
	// QB := squirrel.StatementBuilder.PlaceholderFormat(squirrel.Dollar)
}

func IndexUserHandler(w http.ResponseWriter, r *http.Request) {
	var user []NewUser

	if err := db.Select(&user, "SELECT id,name,email FROM users"); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	utils.SendJSONResponse(w, http.StatusOK, user)
}

func ShowUserHandler(w http.ResponseWriter, r *http.Request) {
	user := User{
		ID:   1,
		Name: "John Doe",
	}
	utils.SendJSONResponse(w, http.StatusOK, user)
}

func StoreUserHandler(w http.ResponseWriter, r *http.Request) {
	var user User
	var err error
	id := r.FormValue("id")
	user.ID, err = strconv.Atoi(id)
	if err != nil {
		utils.HandleError(w, http.StatusBadRequest, err.Error())
		return
	}
	user.Name = r.FormValue("name")
	// create database
	utils.SendJSONResponse(w, http.StatusCreated, user)
}

func UpdateUserHandler(w http.ResponseWriter, r *http.Request) {
	var err error
	id := r.PathValue("id")
	// select user
	user := User{
		ID:   1,
		Name: "John Doe",
	}
	user.ID, err = strconv.Atoi(id)
	if err != nil {
		utils.HandleError(w, http.StatusBadRequest, err.Error())
		return
	}
	if r.FormValue("name") != "" {
		user.Name = r.FormValue("name")
	}

	utils.SendJSONResponse(w, http.StatusOK, user)
}

func DeleteUserHandler(w http.ResponseWriter, r *http.Request) {
	id := r.PathValue("id")
	fmt.Println(id)
	// delete
	utils.SendJSONResponse(w, http.StatusOK, id)
}
