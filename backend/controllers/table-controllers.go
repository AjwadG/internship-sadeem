package controllers

import (
	"internship-project/models"
	"internship-project/utils"
	"net/http"

	"github.com/google/uuid"
)

var (
	tables_columns = []string{
		"id",
		"name",
		"vendor_id",
		"customer_id",
		"is_available",
		"is_needs_service",
	}
)

func IndexTableHandler(w http.ResponseWriter, r *http.Request) {
	var tables []models.Table
	meta, err := utils.QueryBuilder(&tables, "tables", r.URL.Query(), tables_columns, []string{"name"})

	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	if tables == nil {
		tables = []models.Table{}
	}

	utils.SendJSONResponse(w, http.StatusOK, models.Response{
		Meta: meta,
		Data: tables,
	})
}

func ShowTableHandler(w http.ResponseWriter, r *http.Request) {
	id := r.PathValue("id")

	var table models.Table
	query, args, err := QB.Select("*").From("tables").Where("id = ?", id).ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	err = db.Get(&table, query, args...)
	if err != nil {
		utils.HandleError(w, http.StatusNotFound, "Table not found")
		return
	}

	utils.SendJSONResponse(w, http.StatusOK, table)
}

func AddTableHandler(w http.ResponseWriter, r *http.Request) {
	var table models.Table
	var err error

	table.Name = r.FormValue("name")
	if table.Name == "" {
		utils.HandleError(w, http.StatusBadRequest, "Name is required")
		return
	}

	vendorID := r.FormValue("vendor_id")
	if vendorID == "" {
		utils.HandleError(w, http.StatusBadRequest, "Vendor ID is required")
		return
	}
	table.Vendor_id, err = uuid.Parse(vendorID)
	if err != nil {
		utils.HandleError(w, http.StatusBadRequest, "unvalid vendor id")
		return
	}

	customerID := r.FormValue("customer_id")
	if customerID != "" {
		table.Customer_id, err = uuid.Parse(customerID)
	}
	if err != nil {
		utils.HandleError(w, http.StatusBadRequest, "unvalid customer id")
		return
	}

	isAvailable := r.FormValue("is_available")
	if isAvailable == "" {
		isAvailable = "true"
	}
	table.Is_available, err = utils.ParseBool(isAvailable)
	if err != nil {
		utils.HandleError(w, http.StatusBadRequest, "unvalid is_available value")
		return
	}

	isNeedsService := r.FormValue("is_needs_service")
	if isNeedsService == "" {
		isNeedsService = "false"
	}
	table.Is_needs_service, err = utils.ParseBool(isNeedsService)
	if err != nil {
		utils.HandleError(w, http.StatusBadRequest, "unvalid Is_needs_service value")
		return
	}

	table.ID = uuid.New()

	query, args, err := QB.Insert("tables").
		Columns("id", "name", "vendor_id", "customer_id", "is_available", "is_needs_service").
		Values(table.ID, table.Name, table.Vendor_id, table.Customer_id, table.Is_available, table.Is_needs_service).
		ToSql()

	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	_, err = db.Exec(query, args...)
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	utils.SendJSONResponse(w, http.StatusCreated, table)
}

func UpdateTableHandler(w http.ResponseWriter, r *http.Request) {
	id := r.PathValue("id")
	var err error

	existingTable := models.Table{}
	query, args, err := QB.Select("*").From("tables").Where("id = ?", id).ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	err = db.Get(&existingTable, query, args...)
	if err != nil {
		utils.HandleError(w, http.StatusNotFound, "Table not found")
		return
	}

	if name := r.FormValue("name"); name != "" {
		existingTable.Name = name
	}

	if vendorID := r.FormValue("vendor_id"); vendorID != "" {
		if id, err := uuid.Parse(vendorID); err == nil {
			existingTable.Vendor_id = id
		}
	}

	if customerID := r.FormValue("customer_id"); customerID != "" {
		if id, err := uuid.Parse(customerID); err == nil {
			existingTable.Customer_id = id
		}
	}

	if isAvailable := r.FormValue("is_available"); isAvailable != "" {
		existingTable.Is_available, err = utils.ParseBool(isAvailable)
		if err != nil {
			utils.HandleError(w, http.StatusBadRequest, "unvalid Is_available value")
			return
		}
	}

	if isNeedsService := r.FormValue("is_needs_service"); isNeedsService != "" {
		existingTable.Is_needs_service, err = utils.ParseBool(isNeedsService)
		if err != nil {
			utils.HandleError(w, http.StatusBadRequest, "unvalid Is_needs_service value")
			return
		}
	}

	query, args, err = QB.Update("tables").
		Set("name", existingTable.Name).
		Set("vendor_id", existingTable.Vendor_id).
		Set("customer_id", existingTable.Customer_id).
		Set("is_available", existingTable.Is_available).
		Set("is_needs_service", existingTable.Is_needs_service).
		Where("id = ?", id).
		ToSql()

	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	_, err = db.Exec(query, args...)
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	utils.SendJSONResponse(w, http.StatusOK, existingTable)
}

func DeleteTableHandler(w http.ResponseWriter, r *http.Request) {
	id := r.PathValue("id")

	query, args, err := QB.Delete("tables").Where("id = ?", id).ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	_, err = db.Exec(query, args...)
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	utils.SendJSONResponse(w, http.StatusNoContent, nil)
}
