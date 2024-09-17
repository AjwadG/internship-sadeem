import React from "react";
import Layout from "../../components/Layout/Layout";
import { toast } from "react-toastify";
import InputFieldRHF from "../../components/Forms/InputFieldRHF";
import SubmitButton from "../../components/Forms/SubmitButton";
import { useSelector } from "react-redux";
import { useForm } from "react-hook-form";
import { yupResolver } from "@hookform/resolvers/yup";
import { addVendorSchema } from "../../schemes/addVendorSchema";

const AddVendor = () => {
  const userToken = useSelector((state) => state.user.userToken);
  const {
    register,
    handleSubmit,
    reset,
    formState: { errors },
  } = useForm({
    defaultValues: {
      name: "",
      description: "",
      img: null,
    },
    resolver: yupResolver(addVendorSchema),
  });

  const addVendor = (values) => {
    const formData = new FormData();
    formData.append("name", values.name);
    formData.append("description", values.description);

    if (values.img && values.img[0]) {
      formData.append("img", values.img[0]);
    }

    toast.loading("Adding vendor...");

    fetch(`/vendors`, {
      method: "POST",
      headers: {
        Authorization: `Bearer ${userToken}`,
      },
      body: formData,
    })
      .then((res) => res.json())
      .then((data) => {
        toast.dismiss();
        if (data.id) {
          toast.success("Vendor added successfully");
          reset();
        } else {
          toast.error("Error while adding vendor");
        }
      })
      .catch((err) => {
        toast.dismiss();
        toast.error("Error while adding vendor");
      });
  };
  return (
    <Layout title={"Add Vendor"}>
      <form
        onSubmit={handleSubmit(addVendor)}
        style={{ display: "flex", flexDirection: "column", gap: "16px" }}
      >
        <InputFieldRHF
          name="name"
          type="text"
          registrationInput={register("name")}
          errorMessage={errors?.name?.message}
        />
        <InputFieldRHF
          name="description"
          type="text"
          registrationInput={register("description")}
          errorMessage={errors?.description?.message}
        />
        <InputFieldRHF
          name="img"
          type="file"
          registrationInput={register("img")}
          errorMessage={errors?.img?.message}
        />
        <SubmitButton label="add" />
      </form>
    </Layout>
  );
};

export default AddVendor;
