import * as yup from "yup";

export const addVendorSchema = yup.object().shape({
  name: yup
    .string()
    .max(50, "vendor name cannot be longer than 50 characters")
    .required("vendor name is required"),
  description: yup
    .string()
    .min(10, "description must be at least 10 characters")
    .required("description is required"),
  description: yup.string().required("vendor description is required"),
  img: yup
    .mixed()
    .nullable()
    .test("fileType", "only images are allowed", (value) => {
      if (!value) return true;
      return (
        value &&
        ["image/jpeg", "image/png", "image/gif"].includes(value[0].type)
      );
    }),
});
