import React, { useState, useEffect } from "react";
import { BASE_URL } from "../../consts";
import { useSelector } from "react-redux";

import Layout from "../../components/Layout/Layout";
import styles from "./Home.module.css"; // Importing your CSS module
import Card from "../../components/Card/Card";
import Pagination from "../../components/Pagination/Pagination";
import { useNavigate } from "react-router";

const Home = () => {
  const userToken = useSelector((state) => state.user.userToken);
  const [vendors, setVendors] = useState([]);
  const [pagination, setPagination] = useState({
    pageSize: 6,
    curent: 1,
    pages: 1,
  });
  const navigate = useNavigate();

  function sortVendors(type) {
    let sortedVendors = [...vendors];
    switch (type) {
      case "1":
        sortedVendors = sortedVendors.sort((a, b) =>
          a.name.localeCompare(b.name)
        );
        break;
      case "2":
        sortedVendors = sortedVendors.sort((a, b) =>
          b.name.localeCompare(a.name)
        );
        break;
      case "3":
        sortedVendors = sortedVendors.sort(
          (a, b) => new Date(a.created_at) - new Date(b.created_at)
        );
        break;
      case "4":
        sortedVendors = sortedVendors.sort(
          (a, b) => new Date(b.created_at) - new Date(a.created_at)
        );
        break;
    }

    setVendors(sortedVendors);
  }
  useEffect(() => {
    fetch(`${BASE_URL}/vendors`, {
      method: "GET",
      headers: {
        Authorization: `Bearer ${userToken}`,
      },
    })
      .then((res) => res.json())
      .then((data) => {
        setVendors(data);
        pagination.pages = Math.ceil(data.length / pagination.pageSize);
        setPagination(pagination);
      });
  }, []);
  return (
    <Layout title="Vendors">
      <button
        className={styles.addVendorBtn}
        onClick={() => {
          navigate("/vendors/add");
        }}
      >
        Add Vendor
      </button>

      <select
        className={styles.dropdown}
        onChange={(e) => sortVendors(e.target.value)}
      >
        <option value="1">name (A-Z)</option>
        <option value="2">name (Z-A)</option>
        <option value="3">date (newest first)</option>
        <option value="4">date (oldest first)</option>
      </select>

      <div className={styles.vendorGrid}>
        {vendors.map(
          (vendor, index) =>
            index >= pagination.pageSize * (pagination.curent - 1) &&
            index < pagination.pageSize * pagination.curent && (
              <Card key={vendor.id} {...vendor} />
            )
        )}
      </div>

      <Pagination pagination={pagination} setPagination={setPagination} />
    </Layout>
  );
};

export default Home;
