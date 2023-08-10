import React, { useState } from "react";
import { Link, useNavigate } from "react-router-dom";




const Register = () => {
    const [username, setUsername] = useState("");
    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");

    const signUp = () => {
        fetch("http://localhost:8000/ideas/rest-auth/registration", {
            method: "POST",
            body: JSON.stringify(
                {
                    "username": username,
                    "email": email,
                    "password1": password,
                    "password2": password, //confirm password
                }
            ),
            headers: {
                "Content-Type": "application/json",
            },
        }).then((res) => {
            console.log(res.status);
            if(res.status == 204){
                alert("Successful Registration, Please Login");
            }
            else{
                alert("Registration Unsuccessful");
            }
            return res.json();
        })
        .then((data) => {
            console.log(data);
        })
        .catch((err)=>console.log(err));
    };

    const handleSubmit = (e) => {
        e.preventDefault();
        signUp();
        // console.log({ username, email, password });
        setEmail("");
        setUsername("");
        setPassword("");
    };
    
    return (
        <main className='register'>
            <h1 className='registerTitle'>Create an account</h1>
            <form className='registerForm' onSubmit={handleSubmit}>
                <label htmlFor='username'>Username</label>
                <input
                    type='text'
                    name='username'
                    id='username'
                    required
                    value={username}
                    onChange={(e) => setUsername(e.target.value)}
                />
                <label htmlFor='email'>Email Address</label>
                <input
                    type='text'
                    name='email'
                    id='email'
                    required
                    value={email}
                    onChange={(e) => setEmail(e.target.value)}
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
                <button className='registerBtn'>REGISTER</button>
                <p>
                    Have an account? <Link to='/'>Sign in</Link>
                </p>
            </form>
        </main>
    );
};

export default Register;