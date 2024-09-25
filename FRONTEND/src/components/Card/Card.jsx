import React, { useState } from "react";
import { FaEllipsisV, FaEdit, FaTrash, FaEye } from "react-icons/fa";
import styles from "./Card.module.css";

const Card = ({ name, img, description, id, onView, onEdit, onDelete }) => {
  const [showDropdown, setShowDropdown] = useState(false);

  const toggleDropdown = () => setShowDropdown(!showDropdown);

  return (
    <div className={styles.vendorCard}>
      <img src={img} alt={`${name} image`} />
      <h3>{name}</h3>
      <p>{description}</p>
      <div className={styles.moreMenu}>
        <FaEllipsisV className={styles.moreIcon} onClick={toggleDropdown} />
        {showDropdown && (
          <div className={styles.dropdown}>
            <button
              onClick={() => {
                onView(id);
                toggleDropdown();
              }}
            >
              <FaEye />
            </button>
            <button
              onClick={() => {
                onEdit(id);
                toggleDropdown();
              }}
            >
              <FaEdit />
            </button>
            <button
              onClick={() => {
                onDelete(id);
                toggleDropdown();
              }}
            >
              <FaTrash />
            </button>
          </div>
        )}
      </div>
    </div>
  );
};

export default Card;
