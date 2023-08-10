import React, { useEffect, useState } from "react";
import Nav from "./Nav";
import { useNavigate } from "react-router-dom";
import { Divider, Space, Typography,Tag } from 'antd';
import dayjs from 'dayjs';

const { Title, Paragraph, Text, Link } = Typography;

const Home = () => {
    

    
    const [ideas, setIdeas] = useState([]);
    const [keyword, setKeyword] = useState("");

    const getIdeaList = () => {
        fetch('http://localhost:8000/ideas/all/')
        .then((response)=>response.json())
        .then((data)=>{
            console.log(data);
            setIdeas(data);
        })
        .catch((err)=>
        {
            console.log(err.message);
        });
    }


    const navigate = useNavigate();
    


    const enterRead = (idea) => {
        localStorage.setItem("current_idea", JSON.stringify(idea));
        console.log(idea.title);
        navigate("/read");
    }


    const handleSearch = (e) => {
        e.preventDefault();

        fetch(`http://localhost:8000/ideas/all/?keyword=${keyword}`)
        .then((response)=>{
            if(response.status!=200){
                localStorage.setItem("search_results", "[]");
                navigate("/search");
            }
            return response.json();
        })
        .then((data)=>{
            console.log(data);
            if (!data.length){
                localStorage.setItem("search_results", "[]")
            }
            else{
                localStorage.setItem("search_results", JSON.stringify(data))
            }

            navigate("/search");
            
        })
        .catch((err)=>
        {
            console.error(err.message);
        });

        
        
    };

    //check whether the user is authenticated
    useEffect(() => {
        
        const checkUser = () => {
            if (!localStorage.getItem("userToken")) {
                navigate("/");
            } else {
                console.log("Authenticated");
            }
        };
        checkUser();
    }, [navigate]);

    useEffect(getIdeaList,[]);



    
    return (
        <>
            <Nav />
            <main className='home'>
                <h2 className='homeTitle'>Search by tag or destination</h2>
                <form className='homeForm' onSubmit={handleSearch}>
                    <div className='home__container'>
                            <label htmlFor='title'>Keyword</label>
                            <input
                                type='text'
                                name='title'
                                required
                                value={keyword}
                                onChange={(e) =>{setKeyword(e.target.value);}}
                            />
                    </div>
                    <button className='homeBtn'>SEARCH</button>
                </form>

                <div className='thread__container'>
                    {ideas.map((thread) => (
                        <div className='thread__item' key={thread.id} onClick={()=>enterRead(thread)}>
                            <Text strong>{thread.title}</Text>
                            <div className='react__container'>
                                {thread.tags.map((tag, idx) => (idx<5 && <Tag>{tag}</Tag>))}
                                <Space>
                                <p>{thread.destination}</p> 
                                <p>{dayjs(thread.updated_at).format("YYYY-MM-DD")}</p>
                                </Space>
                            </div>
                        </div>
                    ))}
                </div>

            </main>
        </>
    );
};

export default Home;