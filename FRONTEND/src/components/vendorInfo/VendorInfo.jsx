import React from "react";
import { FaEdit, FaTrash } from "react-icons/fa";
import styles from "./VendorInfo.module.css";

const VendorInfo = ({ name, description, img, onEdit, onDelete }) => {
  return (
    <div className={styles.pageContainer}>
      <div className={styles.vendorInfo}>
        <img src={img} alt={`${name} image`} className={styles.vendorImage} />
        <h2 className={styles.vendorName}>{name}</h2>
        <p className={styles.vendorDescription}>{description}</p>
        <div className={styles.buttonContainer}>
          <button onClick={onEdit} className={styles.editButton}>
            <FaEdit /> Edit
          </button>
          <button onClick={onDelete} className={styles.deleteButton}>
            <FaTrash /> Delete
          </button>
        </div>
      </div>
    </div>
  );
};

export default VendorInfo;
