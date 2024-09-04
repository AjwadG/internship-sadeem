import './App.css'
import { createBrowserRouter, RouterProvider} from "react-router-dom";

import { Provider } from "react-redux";
import { store } from "./redux/store.js";
import Tests from './components/tests.jsx';

const router = createBrowserRouter([
  {
    path: "/",
    element: <h1>home page</h1>,
  },
  {
    path:'/login',
    element:<h1>login page</h1>, // login page
  },
  {
    path:'/test',
    element:<Tests/>, // login page
  }
]);
const App = () => {
  return (
    <Provider store={store}>
      <RouterProvider router={router} />
    </Provider>

  )
}

export default App
