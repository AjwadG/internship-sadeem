package main

import (
	"errors"
	"fmt"
	"internship-project/controllers"
	"internship-project/utils"
	"log"
	"net/http"
	"os"
	"path"

	"github.com/go-michi/michi"
	"github.com/golang-migrate/migrate/v4"
	_ "github.com/golang-migrate/migrate/v4/database/postgres"
	_ "github.com/golang-migrate/migrate/v4/source/file"
	"github.com/jmoiron/sqlx"
	"github.com/joho/godotenv"
	_ "github.com/lib/pq"
)

func main() {
	if err := godotenv.Load(); err != nil {
		log.Fatal(err)
	}
	db, err := sqlx.Connect("postgres", os.Getenv("DATABASE_URL"))
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	mig, err := migrate.New(
		"file://"+GetRootpath("database/migrations"),
		os.Getenv("DATABASE_URL"),
	)
	if err != nil {
		log.Fatal(err)
	}
	if err := mig.Up(); err != nil {
		if !errors.Is(err, migrate.ErrNoChange) {
			log.Fatal(err)
		}
		log.Printf("migrations: %s", err.Error())
	}

	controllers.SetDB(db)
	utils.SetDB(db)

	r := michi.NewRouter()
	

	r.Use(utils.CORS)
	r.Route("/", func(sub *michi.Router) {

		r.Handle("/uploads/", http.StripPrefix("/uploads/", http.FileServer(http.Dir("./uploads"))))

		// users routes
		sub.Group(func(users *michi.Router) {
			users.HandleFunc("GET users", controllers.IndexUserHandler)
			users.HandleFunc("GET users/{id}", controllers.ShowUserHandler)
			users.HandleFunc("PUT users/{id}", controllers.UpdateUserHandler)
			users.HandleFunc("DELETE users/{id}", controllers.DeleteUserHandler)
			users.HandleFunc("POST users/grant-role", controllers.GrantRoleHandler)
			users.HandleFunc("POST users/revoke-role", controllers.RevokeRoleHandler)
		})

		// me routes
		sub.Group(func(me *michi.Router) {
			me.Use(utils.ValdiateToken)
			me.HandleFunc("GET me", controllers.MeHandler)
			me.HandleFunc("PUT me", controllers.UpdateMeHandler)
		})

		// Roles routes
		sub.Group(func(roles *michi.Router) {
			roles.HandleFunc("GET roles", controllers.IndexRoleHandler)
			roles.HandleFunc("GET roles/{id}", controllers.ShowRoleHandler)
		})

		// auth routes
		sub.Group(func(auth *michi.Router) {
			auth.HandleFunc("POST signup", controllers.SignUpHandler)
			auth.HandleFunc("POST login", controllers.LoginHandler)
		})

		sub.HandleFunc("GET vendors", controllers.IndexVendorHandler)
		// vendors routes
		sub.Group(func(vendors *michi.Router) {
			vendors.Use(utils.ValdiateToken)
			vendors.HandleFunc("POST vendors", controllers.CreateVendorHandler)
			vendors.HandleFunc("GET vendors/{id}", controllers.ShowVendorHandler)
			vendors.HandleFunc("PUT vendors/{id}", controllers.UpdateVendorHandler)
			vendors.HandleFunc("DELETE vendors/{id}", controllers.DeleteVendorHandler)
			vendors.HandleFunc("POST vendors/assign-admin", controllers.GrantAdminHandler)
			vendors.HandleFunc("POST vendors/revoke-admin", controllers.RevokeAdminHandler)
			vendors.HandleFunc("GET vendors/{id}/admins", controllers.VendorAdminsIndexHandler)
		})

		sub.Group(func(items *michi.Router) {
			items.Use(utils.ValdiateToken)
			items.HandleFunc("GET items", controllers.IndexItemHandler)
			items.HandleFunc("POST items", controllers.CreateItemHandler)
			items.HandleFunc("GET items/{id}", controllers.ShowItemHandler)
			items.HandleFunc("PUT items/{id}", controllers.UpdateItemHandler)
			items.HandleFunc("DELETE items/{id}", controllers.DeleteItemHandler)
		})

		sub.Group(func(cart *michi.Router) {
			cart.Use(utils.ValdiateToken)
			cart.HandleFunc("GET cart", controllers.IndexCartHandler)
			cart.HandleFunc("POST cart/add", controllers.AddCartHandler)
			cart.HandleFunc("POST cart/empty", controllers.EmptyCartHandler)
			cart.HandleFunc("POST cart/checkout", controllers.CheckoutCartHandler)
		})

		sub.Group(func(order *michi.Router) {
			order.Use(utils.ValdiateToken)
			order.HandleFunc("GET orders", controllers.IndexOrdersHandler)
			order.HandleFunc("GET orders/{id}", controllers.ShowOrdersHandler)
			order.HandleFunc("PUT orders/{id}", controllers.UpdateOrdersHandler)
		})

		sub.Group(func(table *michi.Router) {
			table.Use(utils.ValdiateToken)
			table.HandleFunc("GET tables", controllers.IndexTableHandler)
			table.HandleFunc("GET tables/{id}", controllers.ShowTableHandler)
			table.HandleFunc("POST tables", controllers.AddTableHandler)
			table.HandleFunc("PUT tables/{id}", controllers.UpdateTableHandler)
			table.HandleFunc("DELETE tables/{id}", controllers.DeleteTableHandler)
		})

	})
	fmt.Println("Starting server on port 8000")
	http.ListenAndServe(":8000", r)
}

func GetRootpath(dir string) string {
	ex, err := os.Executable()
	if err != nil {
		log.Fatal(err)
	}
	return path.Join(path.Dir(ex), dir)
}
