import React from "react";
import Sidebar from "../Sidebar/Sidebar";
import styles from "./Layout.module.css";

const Layout = ({ children, title }) => {
  return (
    <div className={styles.container}>
      <Sidebar />
      <div className={styles.mainContent}>
        <h1>{title}</h1>
        {children}
      </div>
    </div>
  );
};

export default Layout;
