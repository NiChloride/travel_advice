import React from "react";
import { useNavigate } from "react-router-dom";
const Nav = () => {
    const navigate = useNavigate();
    const signOut = () => {
        localStorage.removeItem("userToken");
    //👇🏻 redirects to the login page
        navigate("/");
    };

    const myPosts =() => {
        navigate("/profile");
    };

    const allPosts =() => {
        navigate("/dashboard");
    };

    const newPost =() => {
        navigate("/create");
    };

    const checkExchangeRates = () => {
        navigate("/exchange");
    }


    return (
        <nav className='navbar'>
            <h2>Travel Ideas</h2>

            <div className='navbarRight'>
                <button onClick={newPost}>New Post</button>
            </div>

            <div className='navbarRight'>
                <button onClick={myPosts}>My Posts</button>
            </div>

            <div className='navbarRight'>
                <button onClick={allPosts}>All Posts</button>
            </div>

            <div className='navbarRight'>
                <button onClick={checkExchangeRates}>Exchange Rates</button>
            </div>

            <div className='navbarRight'>
                <button onClick={signOut}>Sign out</button>
            </div>
        </nav>
    );
};

export default Nav;