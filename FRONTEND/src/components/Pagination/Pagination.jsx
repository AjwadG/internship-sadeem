import React from "react";
import styles from "./Pagination.module.css";

const Pagination = ({ pagination, setPagination }) => {
  return (
    <>
      <div className={styles.pagination}>
        <button
          className={styles.btn}
          disabled={pagination.curent === 1}
          onClick={() =>
            setPagination({ ...pagination, curent: pagination.curent - 1 })
          }
        >
          ❮
        </button>
        <span> {pagination.curent}</span>
        <button
          className={styles.btn}
          disabled={pagination.curent >= pagination.pages}
          onClick={() =>
            setPagination({ ...pagination, curent: pagination.curent + 1 })
          }
        >
          ❯
        </button>
      </div>
    </>
  );
};

export default Pagination;
