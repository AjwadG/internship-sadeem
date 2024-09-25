import React from "react";
import Sidebar from "../Sidebar/Sidebar";
import styles from "./Layout.module.css";
import { ToastContainer } from "react-toastify";

const Layout = ({ children, title }) => {
  return (
    <div className={styles.container}>
      <Sidebar />
      <div className={styles.mainContent}>
        {title && <h1>{title}</h1>}
        {children}
      </div>
      <ToastContainer />
    </div>
  );
};

export default Layout;
