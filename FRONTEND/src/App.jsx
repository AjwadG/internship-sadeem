import "./App.css";
import { createBrowserRouter, RouterProvider } from "react-router-dom";

import { Provider } from "react-redux";
import { store } from "./redux/store.js";
import Login from "./pages/login/Login.jsx";

const router = createBrowserRouter([
  {
    path: "/",
    element: <h1>home page</h1>,
  },
  {
    path: "/login",
    element: <Login />, // login page
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
