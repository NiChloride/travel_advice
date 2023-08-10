import React from "react";
import { BrowserRouter, Route, Routes } from "react-router-dom";
import Register from "./components/Register";
import Login from "./components/Login";
import Home from "./components/Home";
import Profile from "./components/Profile"
import EditPost from "./components/EditPost";
import CreatePost from "./components/CreatePost";
import ReadPost from "./components/ReadPost";
import SearchResults from "./components/SearchResults";
import ExchangeRates from "./components/ExchangeRates";


const App = () => {
    return (
        <div>
            <BrowserRouter>
                <Routes>
                    <Route path='/' element={<Login />} />
                    <Route path='/register' element={<Register />} />
                    <Route path='/dashboard' element={<Home />} />
                    <Route path='/profile' element={<Profile />} />
                    <Route path='/edit' element={<EditPost />} />
                    <Route path='/create' element={<CreatePost />} />
                    <Route path='/read' element={<ReadPost />} />
                    <Route path='/search' element={<SearchResults />} />
                    <Route path='/exchange' element={<ExchangeRates />} />
                </Routes>
            </BrowserRouter>
        </div>
    );
};

export default App;