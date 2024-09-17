import * as yup from "yup";

export const addVendorSchema = yup.object().shape({
    name: yup
        .string()
        .max(50, "vendor name cannot be longer than 50 characters")
        .required("vendor name is required"),
    email: yup
        .string()
        .email("must be a valid email")
        .required("email is required"),
    description: yup
        .string()
        .required("vendor description is required"),
    img: yup
        .mixed()
        .test("fileType", "only images are allowed", (value) => {
            return value && ["image/jpeg", "image/png", "image/gif"].includes(value.type);
        }),
});
