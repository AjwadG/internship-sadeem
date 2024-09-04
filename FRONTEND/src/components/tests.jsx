import {useSelector, useDispatch } from "react-redux";
import {removeUserToken, setUserToken} from "../redux/user/userSlice.js"
const Tests = ()=>{
    const userToken = useSelector(state => state.user.userToken);
    const dispatch = useDispatch();
    const handleRemovingUserToken = ()=> dispatch(removeUserToken());
    const handleRSetingUserToken = ()=> dispatch(setUserToken("token"));
    return (
        <div>
            <p>{userToken}</p>
            <button onClick={handleRemovingUserToken}>Logout</button>
            <button onClick={handleRSetingUserToken}>login</button>
        </div>
    )
}

export default Tests