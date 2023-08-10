import React, { useEffect, useState } from "react";
import Nav from "./Nav";
import { useNavigate } from "react-router-dom";
import { Divider, Space, Typography,Tag } from 'antd';
import dayjs from 'dayjs';

const { Title, Paragraph, Text, Link } = Typography;

const SearchResults = () => {
    

    
    const ideas = JSON.parse(localStorage.getItem("search_results"));



    const navigate = useNavigate();
    


    const enterRead = (idea) => {
        localStorage.setItem("current_idea", JSON.stringify(idea));
        console.log(idea.title);
        navigate("/read");
    }



    
    return (
        <>
            <Nav />
            <main className='home'>
                <h2>{ideas.length} results found</h2>
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

export default SearchResults;