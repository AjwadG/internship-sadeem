package models

import (
	"time"

	"github.com/Masterminds/squirrel"
	"github.com/google/uuid"
	"github.com/jmoiron/sqlx"
)

var (
	db *sqlx.DB
	QB = squirrel.StatementBuilder.PlaceholderFormat(squirrel.Dollar)
)

func SetDB(database *sqlx.DB) {
	db = database
}

type User struct {
	ID         uuid.UUID `db:"id"         json:"id"`
	Name       string    `db:"name"       json:"name"`
	Email      string    `db:"email"      json:"email"`
	Phone      string    `db:"phone"      json:"phone"`
	Img        *string   `db:"img"        json:"img"`
	Password   string    `db:"password"   json:"-"`
	Created_at time.Time `db:"created_at" json:"created_at"`
	Updated_at time.Time `db:"updated_at" json:"updated_at"`
	Roles      []string  `db:"_"      json:"roles"`
}

func (user *User) GetRoles() error {
	query, args, err := QB.Select("roles.name").
		From("user_roles").
		InnerJoin("roles ON roles.id = user_roles.role_id").
		Where("user_id = ?", user.ID).
		ToSql()
	if err != nil {
		return err
	}
	var roles []string
	if err := db.Select(&roles, query, args...); err != nil {
		return err
	}

	user.Roles = roles
	return nil
}

type Vendor struct {
	ID          uuid.UUID `db:"id"          json:"id"`
	Name        string    `db:"name"        json:"name"`
	Img         *string   `db:"img"         json:"img"`
	Description string    `db:"description" json:"description"`
	Created_at  time.Time `db:"created_at"  json:"created_at"`
	Updated_at  time.Time `db:"updated_at"  json:"updated_at"`
}

type Role struct {
	ID   int    `db:"id" json:"id"`
	Name string `db:"name" json:"name"`
}

type Response struct {
	Meta interface{} `json:"meta"`
	Data interface{} `json:"data"`
}

type Meta struct {
	Total        int `json:"total"`
	Per_page     int `json:"per_page"`
	First_page   int `json:"first_page"`
	Current_page int `json:"current_page"`
	Last_page    int `json:"last_page"`
	From         int `json:"from"`
	To           int `json:"to"`
}

type Item struct {
	ID         uuid.UUID `db:"id"          json:"id"`
	Vendor_id  uuid.UUID `db:"vendor_id"   json:"vendor_id"`
	Name       string    `db:"name"        json:"name"`
	Price      float64   `db:"price"       json:"price"`
	Img        *string   `db:"img"         json:"img"`
	Created_at time.Time `db:"created_at"  json:"created_at"`
	Updated_at time.Time `db:"updated_at"  json:"updated_at"`
}

type Cart struct {
	ID         uuid.UUID   `db:"id"          json:"id"`
	TotalPrice float64     `db:"total_price" json:"total_price"`
	Quantity   int         `db:"quantity"    json:"quantity"`
	Vendor_id  uuid.UUID   `db:"vendor_id"   json:"vendor_id"`
	Created_at time.Time   `db:"created_at"  json:"created_at"`
	Updated_at time.Time   `db:"updated_at"  json:"updated_at"`
	Cart_item  []Cart_item `db:"-" json:"cart_item"`
}

type Cart_item struct {
	Cart_id  uuid.UUID `db:"cart_id"     json:"cart_id"`
	Quantity int       `db:"quantity"    json:"quantity"`
	Item_id  uuid.UUID `db:"item_id"     json:"item_id"`
}

type Order struct {
	ID               uuid.UUID     `db:"id"          json:"id"`
	Total_order_cost float64       `db:"total_order_cost" json:"total_order_cost"`
	Vendor_id        uuid.UUID     `db:"vendor_id"   json:"vendor_id"`
	Customer_id      uuid.UUID     `db:"customer_id"   json:"customer_id"`
	Status           string        `db:"status"        json:"status"`
	Created_at       time.Time     `db:"created_at"  json:"created_at"`
	Updated_at       time.Time     `db:"updated_at"  json:"updated_at"`
	Order_items      []Order_items `db:"-" json:"order_items"`
}

type Order_items struct {
	ID       uuid.UUID `db:"id"          json:"id"`
	Order_id uuid.UUID `db:"order_id"     json:"order_id"`
	Quantity int       `db:"quantity"    json:"quantity"`
	Price    float64   `db:"price"       json:"price"`
	Item_id  uuid.UUID `db:"item_id"     json:"item_id"`
}

type Table struct {
	ID               uuid.UUID `db:"id"          json:"id"`
	Name             string    `db:"name"        json:"name"`
	Vendor_id        uuid.UUID `db:"vendor_id"   json:"vendor_id"`
	Customer_id      uuid.UUID `db:"customer_id"   json:"customer_id"`
	Is_available     bool      `db:"is_available"        json:"is_available"`
	Is_needs_service bool      `db:"is_needs_service" json:"is_needs_service"`
}
