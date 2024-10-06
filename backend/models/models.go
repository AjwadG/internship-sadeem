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
