import React, { useState } from "react";
import styles from "./login.module.css";
import { BASE_URL } from "../../consts";

import { setUserToken } from "../../redux/user/userSlice";
import InputField from "../../components/Forms/InputField";
import SubmitButton from "../../components/Forms/SubmitButton";
import { useNavigate } from "react-router";
import { ToastContainer, toast } from "react-toastify";
import "react-toastify/dist/ReactToastify.css";

import { useDispatch } from "react-redux";

const Login = () => {
  const dispatch = useDispatch();
  const [email, setEmail] = useState("");
  const [password, setPassword] = useState("");
  const navigate = useNavigate();

  function submitHandler(e) {
    e.preventDefault();

    if (!email || !password) {
      alert("Please enter email and password");
      return;
    }
    const formData = new FormData();
    formData.append("email", email);
    formData.append("password", password);
    toast.dismiss();
    const LoginToastID = toast.loading("Logining in...");
    fetch(`${BASE_URL}/login`, {
      method: "POST",
      body: formData,
    })
      .then((res) => res.json())
      .then((data) => {
        toast.dismiss(LoginToastID);
        if (data.token) {
          dispatch(setUserToken(data.token));
          navigate("/");
        } else {
          toast.error("Wrong email or password");
        }
      })
      .catch(() => {
        toast.dismiss();
        toast.error("Oops something went wrong");
      });
  }

  return (
    <div className={styles.container}>
      <div className={styles.left_section}>
        <div className={styles.login_box}>
          <h2>Login</h2>
          <form onSubmit={submitHandler}>
            <InputField
              name="email"
              type="email"
              value={email}
              changeHandler={setEmail}
              isRequired={true}
            />
            <InputField
              name="password"
              type="password"
              value={password}
              changeHandler={setPassword}
              isRequired={true}
            />
            <SubmitButton label={"Login"} />
          </form>
        </div>
      </div>
      <div className={styles.right_section}></div>
      <ToastContainer />
    </div>
  );
};

export default Login;
