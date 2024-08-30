package main

import (
	"errors"
	"fmt"
	"internship-project/controllers"
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

	r := michi.NewRouter()
	r.Route("/", func(sub *michi.Router) {
		r.Handle("/uploads/", http.StripPrefix("/uploads/", http.FileServer(http.Dir("./uploads"))))

		sub.HandleFunc("GET users", controllers.IndexUserHandler)
		sub.HandleFunc("GET users/{id}", controllers.ShowUserHandler)
		sub.HandleFunc("PUT users/{id}", controllers.UpdateUserHandler)
		sub.HandleFunc("DELETE users/{id}", controllers.DeleteUserHandler)
		sub.HandleFunc("POST signup", controllers.SignUpHandler)
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