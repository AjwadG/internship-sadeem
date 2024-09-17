import React from "react";
import styles from "./forms.module.css";

const InputFieldRHF = ({ name, type, registrationInput, errorMessage }) => {
  return (
    <div className={styles.input_field}>
      <label htmlFor={name} className={styles.label}>
        {name.charAt(0).toUpperCase() + name.slice(1)}
      </label>
      <input
        className={styles.input}
        type={type}
        id={name}
        {...registrationInput}
        accept={type === "file" ? "image/*" : undefined}
      />
      {errorMessage && <p className={styles.error_msg}>{errorMessage}</p>}
    </div>
  );
};

export default InputFieldRHF;
