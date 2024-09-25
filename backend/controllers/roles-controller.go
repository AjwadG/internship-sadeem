package controllers

import (
	"internship-project/models"
	"internship-project/utils"
	"net/http"

	_ "github.com/joho/godotenv/autoload"
)

var (
	roles_columns = []string{
		"id",
		"name",
	}
)

func IndexRoleHandler(w http.ResponseWriter, r *http.Request) {
	var roles []models.Role

	meta, err := utils.QueryBuilder(&roles, "roles", r.URL.Query(), roles_columns, []string{"name"})

	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	if roles == nil {
		roles = []models.Role{}
	}

	utils.SendJSONResponse(w, http.StatusOK, models.Response{
		Meta: meta,
		Data: roles,
	})
}

func ShowRoleHandler(w http.ResponseWriter, r *http.Request) {
	var role models.Role
	id := r.PathValue("id")
	query, args, err := QB.Select("*").
		From("roles").
		Where("id = ?", id).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	if err := db.Get(&role, query, args...); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	utils.SendJSONResponse(w, http.StatusOK, role)
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
