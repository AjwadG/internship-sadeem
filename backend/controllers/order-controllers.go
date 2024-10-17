package controllers

import (
	"internship-project/models"
	"internship-project/utils"
	"net/http"
)

var (
	order_columns = []string{
		"id",
		"total_order_cost",
		"vendor_id",
		"customer_id",
		"status",
		"created_at",
		"updated_at",
	}
)

func IndexOrdersHandler(w http.ResponseWriter, r *http.Request) {
	var orders []models.Order

	meta, err := utils.QueryBuilder(&orders, "orders", r.URL.Query(), order_columns, []string{})
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	if orders == nil {
		orders = []models.Order{}
	}

	for i := range orders {
		var orderItems []models.Order_items
		query, args, err := QB.Select("*").From("order_items").Where("order_id = ?", orders[i].ID).ToSql()
		if err != nil {
			utils.HandleError(w, http.StatusInternalServerError, err.Error())
			return
		}
		if err := db.Select(&orderItems, query, args...); err != nil {
			utils.HandleError(w, http.StatusInternalServerError, err.Error())
			return
		}
		orders[i].Order_items = orderItems
	}

	utils.SendJSONResponse(w, http.StatusOK, models.Response{
		Meta: meta,
		Data: orders,
	})
}

func ShowOrdersHandler(w http.ResponseWriter, r *http.Request) {
	id := r.PathValue("id")

	var order models.Order

	query, args, err := QB.Select("*").From("orders").Where("id = ?", id).ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	if err := db.Get(&order, query, args...); err != nil {
		utils.HandleError(w, http.StatusNotFound, "Order not found")
		return
	}

	var orderItems []models.Order_items
	query, args, err = QB.Select("*").From("order_items").Where("order_id = ?", order.ID).ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	if err := db.Select(&orderItems, query, args...); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	order.Order_items = orderItems

	utils.SendJSONResponse(w, http.StatusOK, order)
}

func UpdateOrdersHandler(w http.ResponseWriter, r *http.Request) {
	id := r.PathValue("id")

	status := r.FormValue("status")

	query, args, err := QB.Update("orders").
		Set("status", status).
		Where("id = ?", id).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	if _, err := db.Exec(query, args...); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	utils.SendJSONResponse(w, http.StatusOK, map[string]string{"message": "Order status updated successfully"})
}
