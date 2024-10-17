package controllers

import (
	"internship-project/models"
	"internship-project/utils"
	"net/http"
	"strconv"
	"strings"
	"time"

	"github.com/google/uuid"
	_ "github.com/joho/godotenv/autoload"
)

var (
	cart_columns = []string{
		"id",
		"total_price",
		"quantity",
		"vendor_id",
		"created_at",
		"updated_at",
	}
)

func IndexCartHandler(w http.ResponseWriter, r *http.Request) {

	userID := r.Context().Value(utils.UserIDKey).(string)
	var cart models.Cart

	query, args, err := QB.Select(strings.Join(cart_columns, ", ")).
		From("carts").
		Where("id = ?", userID).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	if err := db.Get(&cart, query, args...); err != nil {
		utils.HandleError(w, http.StatusNotFound, "Cart not found")
		return
	}

	var cartItems []models.Cart_item
	query, args, err = QB.Select("*").
		From("cart_items").
		Where("cart_id = ?", cart.ID).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	if err := db.Select(&cartItems, query, args...); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	cart.Cart_item = cartItems

	utils.SendJSONResponse(w, http.StatusOK, cart)
}

func AddCartHandler(w http.ResponseWriter, r *http.Request) {
	userID := r.Context().Value(utils.UserIDKey).(string)

	itemIDStr := r.FormValue("item_id")
	quantityStr := r.FormValue("quantity")

	itemID, err := uuid.Parse(itemIDStr)
	if err != nil {
		utils.HandleError(w, http.StatusBadRequest, "Invalid item ID")
		return
	}

	user_id, err := uuid.Parse(userID)
	if err != nil {
		utils.HandleError(w, http.StatusBadRequest, "Invalid user ID")
		return
	}

	quantity, err := strconv.Atoi(quantityStr)
	if err != nil || quantity <= 0 {
		utils.HandleError(w, http.StatusBadRequest, "Quantity must be a positive integer")
		return
	}

	var item models.Item
	query, args, err := QB.Select(strings.Join(item_columns, ", ")).
		From("items").
		Where("id = ?", itemID).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	err = db.Get(&item, query, args...)
	if err != nil {
		utils.HandleError(w, http.StatusNotFound, "Item does not exist")
		return
	}

	var cart models.Cart
	query, args, err = QB.Select("*").From("carts").Where("id = ?", userID).ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	err = db.Get(&cart, query, args...)
	if err != nil {
		cart = models.Cart{
			ID:         user_id,
			TotalPrice: 0,
			Quantity:   0,
			Vendor_id:  item.Vendor_id,
			Created_at: time.Now(),
			Updated_at: time.Now(),
		}
		query, args, err = QB.Insert("carts").
			Columns("id", "total_price", "quantity", "vendor_id", "created_at", "updated_at").
			Values(cart.ID, cart.TotalPrice, cart.Quantity, cart.Vendor_id, cart.Created_at, cart.Updated_at).
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
	} else {

		if cart.Vendor_id != item.Vendor_id {

			query, args, err = QB.Delete("cart_items").Where("cart_id = ?", cart.ID).ToSql()
			if err != nil {
				utils.HandleError(w, http.StatusInternalServerError, err.Error())
				return
			}
			_, err = db.Exec(query, args...)
			if err != nil {
				utils.HandleError(w, http.StatusInternalServerError, err.Error())
				return
			}

			query, args, err = QB.Update("carts").
				Set("vendor_id", item.Vendor_id).
				Set("total_price", 0).
				Set("quantity", 0).
				Set("updated_at", time.Now()).
				Where("id = ?", cart.ID).
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
		}
	}

	var cartItem models.Cart_item
	query, args, err = QB.Select("*").From("cart_items").
		Where("cart_id = ? AND item_id = ?", cart.ID, itemID).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	err = db.Get(&cartItem, query, args...)

	if err != nil {
		query, args, err = QB.Insert("cart_items").
			Columns("cart_id", "item_id", "quantity").
			Values(cart.ID, itemID, quantity).
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
	} else {
		query, args, err = QB.Update("cart_items").
			Set("quantity", quantity).
			Where("cart_id = ? AND item_id = ?", cart.ID, itemID).
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
	}

	query, args, err = QB.
		Select("cart_items.quantity, items.price").
		From("cart_items").
		Join("items ON cart_items.item_id = items.id").
		Where("cart_items.cart_id = ?", cart.ID).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	type CartItemWithPrice struct {
		Quantity int     `db:"quantity"`
		Price    float64 `db:"price"`
	}
	var cartItemWithPrices []CartItemWithPrice

	err = db.Select(&cartItemWithPrices, query, args...)
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	totalPrice := 0.0
	totalQuantity := 0
	for _, item := range cartItemWithPrices {
		totalPrice += float64(item.Quantity) * item.Price
		totalQuantity += item.Quantity
	}

	query, args, err = QB.Update("carts").
		Set("total_price", totalPrice).
		Set("quantity", totalQuantity).
		Set("updated_at", time.Now()).
		Where("id = ?", cart.ID).
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

	query, args, err = QB.Select(strings.Join(cart_columns, ", ")).
		From("carts").
		Where("id = ?", userID).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	if err := db.Get(&cart, query, args...); err != nil {
		utils.HandleError(w, http.StatusNotFound, "Cart not found")
		return
	}

	var cartItems []models.Cart_item
	query, args, err = QB.Select("*").
		From("cart_items").
		Where("cart_id = ?", cart.ID).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	if err := db.Select(&cartItems, query, args...); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	cart.Cart_item = cartItems

	utils.SendJSONResponse(w, http.StatusOK, cart)
}

func EmptyCartHandler(w http.ResponseWriter, r *http.Request) {
	userID := r.Context().Value(utils.UserIDKey).(string)

	var cart models.Cart
	query, args, err := QB.Select(strings.Join(cart_columns, ", ")).
		From("carts").
		Where("id = ?", userID).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	if err := db.Get(&cart, query, args...); err != nil {
		utils.HandleError(w, http.StatusNotFound, "Cart not found")
		return
	}

	query, args, err = QB.Delete("cart_items").
		Where("cart_id = ?", cart.ID).
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

	query, args, err = QB.Update("carts").
		Set("total_price", 0).
		Set("quantity", 0).
		Set("vendor_id", nil).
		Set("updated_at", time.Now()).
		Where("id = ?", cart.ID).
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

	utils.SendJSONResponse(w, http.StatusOK, "Cart emptied successfully")
}

func CheckoutCartHandler(w http.ResponseWriter, r *http.Request) {

	userID := r.Context().Value(utils.UserIDKey).(string)

	user_id, err := uuid.Parse(userID)
	if err != nil {
		utils.HandleError(w, http.StatusBadRequest, "Invalid user ID")
		return
	}

	var cart models.Cart
	query, args, err := QB.Select("*").From("carts").Where("id = ?", user_id).ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	err = db.Get(&cart, query, args...)
	if err != nil {
		utils.HandleError(w, http.StatusNotFound, "Cart does not exist")
		return
	}

	if cart.Quantity == 0 {
		utils.HandleError(w, http.StatusNotFound, "cart is empty")
		return
	}

	var cartItems []models.Cart_item
	query, args, err = QB.Select("*").From("cart_items").Where("cart_id = ?", user_id).ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	err = db.Select(&cartItems, query, args...)
	if err != nil {
		utils.HandleError(w, http.StatusNotFound, "No items found in the cart")
		return
	}

	tx, err := db.Beginx()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	defer tx.Rollback()

	order := models.Order{
		ID:               uuid.New(),
		Total_order_cost: cart.TotalPrice,
		Vendor_id:        cart.Vendor_id,
		Customer_id:      user_id,
		Status:           "preparing",
		Created_at:       time.Now(),
		Updated_at:       time.Now(),
	}

	query, args, err = QB.Insert("orders").
		Columns("id", "total_order_cost", "vendor_id", "customer_id", "status", "created_at", "updated_at").
		Values(order.ID, order.Total_order_cost, order.Vendor_id, order.Customer_id, order.Status, order.Created_at, order.Updated_at).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	_, err = tx.Exec(query, args...)
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	for _, item := range cartItems {

		var itemDetails models.Item
		itemQuery, itemArgs, err := QB.Select("price").From("items").Where("id = ?", item.Item_id).ToSql()
		if err != nil {
			utils.HandleError(w, http.StatusInternalServerError, err.Error())
			return
		}
		err = db.Get(&itemDetails, itemQuery, itemArgs...)
		if err != nil {
			utils.HandleError(w, http.StatusNotFound, "Item not found")
			return
		}

		query, args, err = QB.Insert("order_items").
			Columns("order_id", "item_id", "quantity", "price").
			Values(order.ID, item.Item_id, item.Quantity, itemDetails.Price).
			ToSql()
		if err != nil {
			utils.HandleError(w, http.StatusInternalServerError, err.Error())
			return
		}

		_, err = tx.Exec(query, args...)
		if err != nil {
			utils.HandleError(w, http.StatusInternalServerError, err.Error())
			return
		}
	}

	query, args, err = QB.Delete("cart_items").
		Where("cart_id = ?", user_id).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	_, err = tx.Exec(query, args...)
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	query, args, err = QB.Update("carts").
		Set("total_price", 0).
		Set("quantity", 0).
		Set("vendor_id", nil).
		Set("updated_at", time.Now()).
		Where("id = ?", cart.ID).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	_, err = tx.Exec(query, args...)
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	if err = tx.Commit(); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	utils.SendJSONResponse(w, http.StatusOK, map[string]string{"message": "Order placed"})
}
