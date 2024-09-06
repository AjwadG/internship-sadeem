package controllers

import (
	"fmt"
	"internship-project/models"
	"internship-project/utils"
	"log"
	"net/http"
	"strings"
	"time"

	"github.com/Masterminds/squirrel"
	"github.com/google/uuid"
	_ "github.com/joho/godotenv/autoload"
)

var (
	vendor_columns = []string{
		"id",
		"name",
		"description",
		"created_at",
		"updated_at",
		fmt.Sprintf("CASE WHEN NULLIF(img, '') IS NOT NULL THEN FORMAT('%s/%%s', img) ELSE NULL END AS img", Domain),
	}
)

func IndexVendorHandler(w http.ResponseWriter, r *http.Request) {
	var vendors []models.Vendor

	query, args, err := QB.Select(strings.Join(vendor_columns, ", ")).
		From("vendors").
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	if err := db.Select(&vendors, query, args...); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	// userID, ok := r.Context().Value(utils.UserIDKey).(string)
	// if !ok {
	// 	http.Error(w, "UserID not found in token", http.StatusInternalServerError)
	// 	return
	// }
	utils.SendJSONResponse(w, http.StatusOK, vendors)
}

func ShowVendorHandler(w http.ResponseWriter, r *http.Request) {
	var vendor models.Vendor
	id := r.PathValue("id")
	query, args, err := QB.Select(strings.Join(vendor_columns, ", ")).
		From("vendors").
		Where("id = ?", id).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	if err := db.Get(&vendor, query, args...); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	utils.SendJSONResponse(w, http.StatusOK, vendor)
}

func UpdateVendorHandler(w http.ResponseWriter, r *http.Request) {
	var vendor models.Vendor
	id := r.PathValue("id")
	query, args, err := QB.Select(vendor_columns...).
		From("vendors").
		Where("id = ?", id).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	if err := db.Get(&vendor, query, args...); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, err.Error())
		return
	}
	// update vendor
	if r.FormValue("name") != "" {
		vendor.Name = r.FormValue("name")
	}
	if r.FormValue("description") != "" {
		vendor.Description = r.FormValue("description")
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
		if vendor.Img != nil {
			oldImg = vendor.Img
		}
		imageName, err := utils.SaveImageFile(file, "vendors", fileHeader.Filename)
		if err != nil {
			utils.HandleError(w, http.StatusInternalServerError, "Error saving image file: "+err.Error())
			return
		}
		vendor.Img = &imageName
		newImg = &imageName
	}
	if vendor.Img != nil {
		*vendor.Img = strings.TrimPrefix(*vendor.Img, utils.Domain+"/")
	}

	query, args, err = QB.
		Update("vendors").
		Set("img", vendor.Img).
		Set("name", vendor.Name).
		Set("description", vendor.Description).
		Set("updated_at", time.Now()).
		Where(squirrel.Eq{"id": vendor.ID}).
		Suffix(fmt.Sprintf("RETURNING %s", strings.Join(vendor_columns, ", "))).
		ToSql()
	if err != nil {
		utils.DeleteImageFile(*newImg)
		utils.HandleError(w, http.StatusInternalServerError, "Error building query")
		return
	}

	if err := db.QueryRowx(query, args...).StructScan(&vendor); err != nil {
		utils.DeleteImageFile(*newImg)
		utils.HandleError(w, http.StatusInternalServerError, "Error creating vendor"+err.Error())
		return
	}

	if oldImg != nil {
		if err := utils.DeleteImageFile(*oldImg); err != nil {
			log.Println(err)
		}
	}

	utils.SendJSONResponse(w, http.StatusOK, vendor)
}

func DeleteVendorHandler(w http.ResponseWriter, r *http.Request) {
	id := r.PathValue("id")
	// Use QB to build the delete query
	query, args, err := QB.Delete("vendors").
		Where("id = ?", id).
		Suffix("RETURNING img").
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, "Error building query: "+err.Error())
		return
	}

	var img *string
	if err := db.QueryRow(query, args...).Scan(&img); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, "Error deleting vendor: "+err.Error())
		return
	}
	// If the vendor has an image, delete it
	if img != nil {
		if err := utils.DeleteImageFile(*img); err != nil {
			log.Println(err)
		}
	}

	w.WriteHeader(http.StatusNoContent)
}

func CreateVendorHandler(w http.ResponseWriter, r *http.Request) {
	vendor := models.Vendor{
		ID:          uuid.New(),
		Name:        r.FormValue("name"),
		Description: r.FormValue("description"),
	}

	file, fileHeader, err := r.FormFile("img")
	if err != nil && err != http.ErrMissingFile {
		utils.HandleError(w, http.StatusBadRequest, "Invalid file")
		return
	} else if err == nil {
		defer file.Close()
		imageName, err := utils.SaveImageFile(file, "vendors", fileHeader.Filename)
		if err != nil {
			utils.HandleError(w, http.StatusInternalServerError, "Error saving image")
		}
		vendor.Img = &imageName
	}

	query, args, err := QB.
		Insert("vendors").
		Columns("id", "img", "name", "description").
		Values(vendor.ID, vendor.Img, vendor.Name, vendor.Description).
		Suffix(fmt.Sprintf("RETURNING %s", strings.Join(vendor_columns, ", "))).
		ToSql()
	if err != nil {
		utils.HandleError(w, http.StatusInternalServerError, "Error generate query")
		return
	}

	if err := db.QueryRowx(query, args...).StructScan(&vendor); err != nil {
		utils.HandleError(w, http.StatusInternalServerError, "Error creating vendor"+err.Error())
		return
	}
	utils.SendJSONResponse(w, http.StatusCreated, vendor)

}
