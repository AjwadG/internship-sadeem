package controllers

import (
	"fmt"
	"internship-project/models"
	"internship-project/utils"
	"log"
	"net/http"
	"strconv"
	"strings"
	"time"

	"github.com/Masterminds/squirrel"
	"github.com/google/uuid"
	_ "github.com/joho/godotenv/autoload"
)

var (
	item_columns = []string{
		"id",
		"vendor_id",
		"name",
		"price",
		"created_at",
		"updated_at",
		fmt.Sprintf("CASE WHEN NULLIF(img, '') IS NOT NULL THEN FORMAT('%s/%%s', img) ELSE NULL END AS img", Domain),
	}
)

func IndexItemHandler(w http.ResponseWriter, r *http.Request) {
	var items []models.Item

	meta, err := utils.QueryBuilder(&items, "items", r.URL.Query(), item_columns, []string{"name", "price"})

	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	if items == nil {
		items = []models.Item{}
	}

	utils.SendJSONResponse(w, http.StatusOK, models.Response{
		Meta: meta,
		Data: items,
	})
}

func CreateItemHandler(w http.ResponseWriter, r *http.Request) {
	item := models.Item{
		ID:         uuid.New(),
		Name:       r.FormValue("name"),
		Created_at: time.Now(),
		Updated_at: time.Now(),
	}

	vendor_id := r.FormValue("vendor_id")
	price := r.FormValue("price")

	if vendor_id == "" || price == "" || item.Name == "" {
		utils.HandleError(w, http.StatusBadRequest, "Missing required parameters")
	}

	parsedVendorID, err := uuid.Parse(vendor_id)

	if err != nil {
		utils.HandleError(w, http.StatusBadRequest, "Invalid vendor ID")
	}

	item.Vendor_id = parsedVendorID

	floatValue, err := strconv.ParseFloat(price, 64)

	if err != nil {
		utils.HandleError(w, http.StatusBadRequest, "Invalid price")
	}

	item.Price = floatValue

	file, fileHeader, err := r.FormFile("img")
	if err != nil && err != http.ErrMissingFile {
		utils.HandleError(w, http.StatusBadRequest, "Invalid file")
		return
	} else if err == nil {
		defer file.Close()
		imageName, err := utils.SaveImageFile(file, "items", fileHeader.Filename)
		if err != nil {
			utils.HandleError(w, http.StatusInternalServerError, "Error saving image")
		}
		item.Img = &imageName
	}

	query, args, err := QB.
		Insert("items").
		Columns("id", "vendor_id", "name", "price", "created_at", "updated_at", "img").
		Values(item.ID, item.Vendor_id, item.Name, item.Price, item.Created_at, item.Updated_at, item.Img).
		Suffix(fmt.Sprintf("RETURNING %s", strings.Join(item_columns, ", "))).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, "Error generate query")
		utils.DeleteImageFile(*item.Img)
		return
	}

	if err := db.Get(&item, query, args...); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		utils.DeleteImageFile(*item.Img)
		return
	}

	utils.SendJSONResponse(w, http.StatusOK, item)
}

func ShowItemHandler(w http.ResponseWriter, r *http.Request) {
	var item models.Item
	id := r.PathValue("id")
	query, args, err := QB.Select(strings.Join(item_columns, ", ")).
		From("items").
		Where("id = ?", id).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	if err := db.Get(&item, query, args...); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	utils.SendJSONResponse(w, http.StatusOK, item)
}

func DeleteItemHandler(w http.ResponseWriter, r *http.Request) {
	id := r.PathValue("id")

	query, args, err := QB.Delete("items").Where("id = ?", id).Suffix("RETURNING img").ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, "Error building query: "+err.Error())
		return
	}

	var img *string
	if err := db.QueryRow(query, args...).Scan(&img); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, "Error deleting vendor: "+err.Error())
		return
	}

	if img != nil {
		if err := utils.DeleteImageFile(*img); err != nil {
			log.Println(err)
		}
	}

	w.WriteHeader(http.StatusNoContent)
}

func UpdateItemHandler(w http.ResponseWriter, r *http.Request) {
	var item models.Item
	id := r.PathValue("id")
	query, args, err := QB.Select(item_columns...).
		From("items").
		Where("id = ?", id).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	if err := db.Get(&item, query, args...); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}

	if r.FormValue("name") != "" {
		item.Name = r.FormValue("name")
	}

	if r.FormValue("price") != "" {
		price, err := strconv.ParseFloat(r.FormValue("price"), 64)
		if err != nil {
			utils.HandleError(w, http.StatusBadRequest, "Invalid price")
			return
		}
		item.Price = price
	}

	if r.FormValue("vendor_id") != "" {
		vendorID, err := uuid.Parse(r.FormValue("vendor_id"))
		if err != nil {
			utils.HandleError(w, http.StatusBadRequest, "Invalid vendor ID")
			return
		}
		item.Vendor_id = vendorID
	}

	var oldImg *string
	var newImg *string
	// Handle image file upload
	file, fileHeader, err := r.FormFile("img")
	if err != nil && err != http.ErrMissingFile {
		utils.HandleError(w, http.StatusBadRequest, "Error retrieving file: "+err.Error())
		return
	} else if err == nil {
		defer file.Close()
		if item.Img != nil {
			oldImg = item.Img
		}
		imageName, err := utils.SaveImageFile(file, "items", fileHeader.Filename)
		if err != nil {
			utils.HandleError(w, http.StatusInternalServerError, "Error saving image file: "+err.Error())
			return
		}
		item.Img = &imageName
		newImg = &imageName
	}
	if item.Img != nil {
		*item.Img = strings.TrimPrefix(*item.Img, utils.Domain+"/")
	}

	query, args, err = QB.Update("items").
		Set("name", item.Name).
		Set("price", item.Price).
		Set("vendor_id", item.Vendor_id).
		Set("img", newImg).
		Set("updated_at", time.Now()).
		Where(squirrel.Eq{"id": item.ID}).
		Suffix(fmt.Sprintf("RETURNING %s", strings.Join(item_columns, ", "))).
		ToSql()
	if err != nil {
		fmt.Println(err)
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		utils.DeleteImageFile(*oldImg)
		return
	}
	if err := db.QueryRowx(query, args...).StructScan(&item); err != nil {
		utils.DeleteImageFile(*newImg)
		utils.HandleError(w, http.StatusInternalServerError, "Error creating item"+err.Error())
		return
	}

	if oldImg != nil {
		if err := utils.DeleteImageFile(*oldImg); err != nil {
			log.Println(err)
		}
	}
	utils.SendJSONResponse(w, http.StatusOK, item)
}
