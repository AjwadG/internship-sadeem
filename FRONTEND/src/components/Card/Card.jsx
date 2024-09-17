import React from "react";
import styles from "./Card.module.css";

const Card = ({ name, img, description, id }) => {
  return (
    <div className={styles.vendorCard}>
      <img src={img} alt={`${name} image`} />
      <h3>{name}</h3>
      <p>{description}</p>
    </div>
  );
};

export default Card;
