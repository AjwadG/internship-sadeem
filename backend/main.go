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

	fmt.Println("file://" + GetRootpath("database/migrations"))
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

		// Roles routes
		sub.Group(func(roles *michi.Router) {
			roles.HandleFunc("GET roles", controllers.IndexRoleHandler)
			roles.HandleFunc("GET roles/{id}", controllers.ShowRoleHandler)
		})

		sub.Group(func(auth *michi.Router) {
			auth.HandleFunc("POST signup", controllers.SignUpHandler)
			auth.HandleFunc("POST login", controllers.LoginHandler)
		})

		// vendors routes
		sub.Group(func(vendors *michi.Router) {
			vendors.HandleFunc("GET vendors", utils.ValdiateToken(controllers.IndexVendorHandler))
			vendors.HandleFunc("POST vendors", utils.ValdiateToken(controllers.CreateVendorHandler))
			vendors.HandleFunc("GET vendors/{id}", utils.ValdiateToken(controllers.ShowVendorHandler))
			vendors.HandleFunc("PUT vendors/{id}", utils.ValdiateToken(controllers.UpdateVendorHandler))
			vendors.HandleFunc("DELETE vendors/{id}", utils.ValdiateToken(controllers.DeleteVendorHandler))
			// vendors.HandleFunc("POST vendors/assign-admin", controllers.GrantAdminHandler)
			// vendors.HandleFunc("POST vendors/revoke-admin", controllers.RevokeAdminHandler)
			// vendors.HandleFunc("GET vendors/{id}/admins", controllers.VendorAdminsIndexHandler)
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
