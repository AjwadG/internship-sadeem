import { createBrowserRouter, RouterProvider } from "react-router-dom";

import { Provider } from "react-redux";
import { store } from "./redux/store.js";

import Login from "./pages/login/Login.jsx";
import Home from "./pages/home/Home.jsx";
import AddVendor from "./pages/Vendors/AddVendor.jsx";
import EditVendor from "./pages/Vendors/EditVendor.jsx";
import Guard from "./components/guard/Guard.jsx";
import ViewVendor from "./pages/Vendors/ViewVendor.jsx";

const router = createBrowserRouter([
  {
    path: "/",
    element: (
      <Guard>
        <Home />
      </Guard>
    ),
  },
  {
    path: "/vendors/edit/:id",
    element: (
      <Guard>
        <EditVendor />{" "}
      </Guard>
    ),
  },
  {
    path: "/vendors/view/:id",
    element: (
      <Guard>
        <ViewVendor />{" "}
      </Guard>
    ),
  },
  {
    path: "/login",
    element: <Login />, // login page
  },
  {
    path: "/vendors/add",
    element: (
      <Guard>
        <AddVendor />{" "}
      </Guard>
    ),
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
