import React from "react";
import { Navigate } from "react-router-dom";
import { useSelector } from "react-redux";

import { jwtDecode } from "jwt-decode";

const isTokenValid = (token) => {
  try {
    if (!token) return false;

    const decodedToken = jwtDecode(token);
    const currentTime = Date.now() / 1000; // in seconds

    return decodedToken.exp > currentTime; // Check if token is expired
  } catch (error) {
    console.error("Invalid token", error);
    return false;
  }
};

const Guard = ({ children }) => {
  const userToken = useSelector((state) => state.user.userToken);

  if (!isTokenValid(userToken)) {
    return <Navigate to="/login" />;
  }

  return children;
};

export default Guard;
