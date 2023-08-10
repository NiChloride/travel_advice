import React, { useEffect, useState } from "react";
import dayjs from 'dayjs';
import Nav from "./Nav";
import { useNavigate } from "react-router-dom";
import { Divider, Space, Tag, Typography } from 'antd';

const { Title, Paragraph, Text, Link } = Typography;




const ReadPost = () => {


    const idea = JSON.parse(localStorage.getItem("current_idea"));
   
    console.log(idea);






    const navigate = useNavigate();

        

    return (
        <>

            <Nav />

            <Typography className="readPost">
                {idea.tags.map((tag) => (<Tag>{tag}</Tag>))}
                <Text>Last Updated: {dayjs(idea.updated_at).format("YYYY-MM-DD")}</Text>
                <Title>{idea.title}</Title>
                <Paragraph>
                    <pre>{idea.description}</pre>
                </Paragraph>
                <Paragraph>
                    <Title level={4} style={{color:"#674188"}}>Destination: {idea.destination}</Title>
                    <Title level={4} style={{color:"#674188"}}>Period: {idea.start_date} - {idea.end_date}</Title>
                </Paragraph>
            </Typography>

   
            
        </>
    );

}


export default ReadPost;
