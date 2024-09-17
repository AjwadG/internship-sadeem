import React, { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import VendorInfo from "../../components/vendorInfo/VendorInfo";
import { BASE_URL } from "../../consts";
import { useSelector } from "react-redux";
import { toast } from "react-toastify";
import Layout from "../../components/Layout/Layout";

const ViewVendor = () => {
  const { id } = useParams(); // Get vendor ID from URL
  const navigate = useNavigate(); // For navigation
  const [vendor, setVendor] = useState(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);
  const userToken = useSelector((state) => state.user.userToken);

  useEffect(() => {
    fetch(`${BASE_URL}/vendors/${id}`, {
      headers: {
        Authorization: `Bearer ${userToken}`,
      },
    })
      .then((res) => res.json())
      .then((data) => {
        if (data.error) {
          setError("Vendor not found");
          setLoading(false);
          return;
        }
        setVendor(data);
        setLoading(false);
      })
      .catch((err) => {
        setError("Error while fetching vendor");
        setLoading(false);
      });
  }, [id]);

  function handleVendorDelete() {
    toast.loading("Deleting vendor...");
    fetch(`${BASE_URL}/vendors/${id}`, {
      method: "DELETE",
      headers: {
        Authorization: `Bearer ${userToken}`,
      },
    })
      .then((res) => {
        toast.dismiss();
        if (res.status === 204) {
          toast.success("Vendor deleted successfully");
          navigate("/");
        } else {
          toast.error("Error while deleting vendor");
        }
      })
      .catch((err) => {
        toast.dismiss();
        toast.error("Error while deleting vendor");
      });
  }

  function handleVendorEdit() {
    navigate(`/vendors/edit/${id}`);
  }

  function getTitle() {
    if (loading) return "Loading...";
    if (error) return error;
    return false;
  }

  return (
    <Layout title={getTitle()}>
      {!error && !loading && vendor && (
        <VendorInfo
          name={vendor.name}
          description={vendor.description}
          img={vendor.img}
          onEdit={handleVendorEdit}
          onDelete={handleVendorDelete}
        />
      )}
    </Layout>
  );
};

export default ViewVendor;
