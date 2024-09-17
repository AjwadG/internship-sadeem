import React from "react";
import styles from "./forms.module.css";

const SubmitButton = ({ label }) => {
  return <button className={styles.submit_button}>{label}</button>;
};

export default SubmitButton;
