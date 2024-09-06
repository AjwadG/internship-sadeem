import React from "react";
import styles from "./login.module.css";

const Login = () => {
  return (
    <div className={styles.container}>
      <div className={styles.left_section}>
        <div className={styles.login_box}>
          <h2>Login</h2>
          <form>
            <label htmlFor="email">Emial</label>
            <input type="email" id="email" />
            <label htmlFor="password">password</label>
            <input type="password" id="password" />
            <button type="submit">Login</button>
          </form>
        </div>
      </div>
      <div className={styles.right_section}></div>
    </div>
  );
};

export default Login;
