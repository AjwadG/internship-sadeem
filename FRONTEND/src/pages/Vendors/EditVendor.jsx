import React, { useEffect, useState } from "react";
import Layout from "../../components/Layout/Layout";
import { BASE_URL } from "../../consts";
import { toast } from "react-toastify";
import { useParams } from "react-router-dom";
import InputFieldRHF from "../../components/Forms/InputFieldRHF";
import SubmitButton from "../../components/Forms/SubmitButton";
import { useSelector } from "react-redux";
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";
import { addVendorSchema } from "../../schemes/addVendorSchema";

const EditVendor = () => {
  const userToken = useSelector((state) => state.user.userToken);
  const { id } = useParams();
  const [vendor, setVendor] = useState(null);
  const {
    register,
    handleSubmit,
    reset,
    formState: { errors },
  } = useForm({
    resolver: yupResolver(addVendorSchema),
  });

  useEffect(() => {
    fetch(`${BASE_URL}/vendors/${id}`, {
      headers: {
        Authorization: `Bearer ${userToken}`,
      },
    })
      .then((res) => res.json())
      .then((data) => {
        setVendor(data);
        reset({
          name: data.name,
          description: data.description,
          img: null,
        });
      });
  }, [id, reset]);

  const editVendor = (values) => {
    const formData = new FormData();
    formData.append("name", values.name);
    formData.append("description", values.description);

    if (values.img && values.img[0]) {
      formData.append("img", values.img[0]);
    }

    toast.loading("Updating vendor...");

    fetch(`${BASE_URL}/vendors/${id}`, {
      method: "PUT",
      headers: {
        Authorization: `Bearer ${userToken}`,
      },
      body: formData,
    })
      .then((res) => res.json())
      .then((data) => {
        toast.dismiss();
        if (data.id) {
          toast.success("Vendor updated successfully");
          setVendor(data);
          reset({
            name: data.name,
            description: data.description,
            img: null,
          });
        } else {
          toast.error("Error while updating vendor");
        }
      })
      .catch((err) => {
        toast.dismiss();
        toast.error("Error while updating vendor");
      });
  };
  return (
    <Layout title={vendor !== null ? `Edit of ${vendor.name} ` : "Loading ..."}>
      <form
        onSubmit={handleSubmit(editVendor)}
        style={{ display: "flex", flexDirection: "column", gap: "16px" }}
      >
        <InputFieldRHF
          name="name"
          type="text"
          registrationInput={register("name")}
          errorMessage={errors?.name?.message}
        />

        <div
          style={{
            display: "flex",
            alignItems: "center",
            justifyContent: "space-around",
            gap: "20px",
          }}
        >
          <div style={{ width: "30%", overflow: "hidden" }}>
            <img
              src={vendor ? vendor.img : ""} // Replace with the correct vendor image URL field
              alt="Old Vendor"
              style={{ width: "100%", height: "100%", objectFit: "cover" }}
            />
          </div>
          <div style={{ width: "50%" }}>
            <InputFieldRHF
              name="description"
              type="text"
              registrationInput={register("description")}
              errorMessage={errors?.description?.message}
            />
            <InputFieldRHF
              name="New img"
              type="file"
              registrationInput={register("img")}
              errorMessage={errors?.img?.message}
            />
            <SubmitButton label="edit" />
          </div>
        </div>
      </form>
    </Layout>
  );
};

export default EditVendor;
