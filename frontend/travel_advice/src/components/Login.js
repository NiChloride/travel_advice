import React, { useState } from "react";
import { Link, useNavigate } from "react-router-dom";

const Login = () => {
    const [username, setUsername] = useState("");
    const [password, setPassword] = useState("");

    //useNavigate hook of React Router
    const navigate = useNavigate();

    const loginUser = () =>{
        fetch(
            "http://localhost:8000/ideas/rest-auth/login/",
            {
                method: "POST",
                body: JSON.stringify(
                    {

                        "username": username,
                        "password": password,
                    }
                ),
                headers: {
                    "Content-Type": "application/json",
                },
            }
        )
        .then((res) => {
            console.log(res.status);
            if(res.status != 200)
            {
                alert("Wrong username or password.")
            }
            return res.json();
        })
        .then((data)=>{
            if(data["key"])
            {
                // alert(data["key"]);
                console.log(data["key"]);
                navigate("/dashboard");
                localStorage.setItem("userToken", data["key"])
            }
        }).catch((err) => console.error(err));
    };


    const handleSubmit = (e) => {
        e.preventDefault();
        // console.log({ username, password });
        loginUser();
        setUsername("");
        setPassword("");
    };

    return (
        <main className='login'>
            <h1 className='loginTitle'>Log into your account</h1>
            <form className='loginForm' onSubmit={handleSubmit}>
                <label htmlFor='username'>Username</label>
                <input
                    type='text'
                    name='username'
                    id='username'
                    required
                    value={username}
                    onChange={(e) => setUsername(e.target.value)}
                />
                <label htmlFor='password'>Password</label>
                <input
                    type='password'
                    name='password'
                    id='password'
                    required
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                />
                <button className='loginBtn'>SIGN IN</button>
                <p>
                    Don't have an account? <Link to='/register'>Create one</Link>
                </p>
            </form>
        </main>
    );
};
export default Login;