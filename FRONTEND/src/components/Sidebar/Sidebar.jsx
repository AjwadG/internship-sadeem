import React from "react";
import styles from "./Sidebar.module.css";
import {
  FaUser,
  FaStore,
  FaTable,
  FaBox,
  FaShoppingCart,
} from "react-icons/fa";

const Sidebar = () => {
  return (
    <div className={styles.sidebar}>
      <img src="/images/logo.svg" alt="Cheffest Logo" />
      <ul>
        <li>
          <FaUser className={styles.icon} />
          <a href="/users">Users</a>
        </li>
        <li>
          <FaStore className={styles.icon} />
          <a href="/vendors">Vendors</a>
        </li>
        <li>
          <FaTable className={styles.icon} />
          <a href="/tables">Tables</a>
        </li>
        <li>
          <FaBox className={styles.icon} />
          <a href="/items">Items</a>
        </li>
        <li>
          <FaShoppingCart className={styles.icon} />
          <a href="/orders">Orders</a>
        </li>
      </ul>
    </div>
  );
};

export default Sidebar;
