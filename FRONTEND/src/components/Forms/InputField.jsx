import React from "react";
import styles from "./forms.module.css";

const InputField = ({ name, type, value, changeHandler, isRequired }) => {
  return (
    <div className={styles.input_field}>
      <label htmlFor={name} className={styles.label}>
        {name.charAt(0).toUpperCase() + name.slice(1)}
      </label>
      <input
        className={styles.input}
        type={type}
        id={name}
        onChange={(e) => changeHandler(e.target.value)}
        value={value}
        required={isRequired}
      />
    </div>
  );
};

export default InputField;
