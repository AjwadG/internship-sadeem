import { createBrowserRouter, RouterProvider } from "react-router-dom";

import { Provider } from "react-redux";
import { store } from "./redux/store.js";

import Login from "./pages/login/Login.jsx";
import Home from "./pages/home/Home.jsx";
import AddVendor from "./pages/Vendors/AddVendor.jsx";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Home />,
  },
  {
    path: "/login",
    element: <Login />, // login page
  },
  {
    path: "/vendors/add",
    element: <AddVendor />,
  },
]);
const App = () => {
  return (
    <Provider store={store}>
      <RouterProvider router={router} />
    </Provider>
  );
};

export default App;
