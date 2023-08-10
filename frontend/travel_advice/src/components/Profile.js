import React, { useEffect, useState } from "react";
import Nav from "./Nav";
import { useNavigate } from "react-router-dom";
import dayjs from "dayjs"

const Home = () => {
    
    const [title, setTitle] = useState("placeholder text");
    const [destination, setDestination] = useState("placeholder text");
    const [description, setDescription] = useState("placeholder text");
    const [tags, setTags] = useState(["placeholder tag"]);
    const [start_date, setStart_date] = useState("1970-01-01");
    const [end_date, setEnd_date] = useState("1970-01-01");

    const [ideas, setIdeas] = useState([]);

    const user_token = localStorage.getItem("userToken");


    const getIdeaList = () => {
        fetch(`http://localhost:8000/ideas/all/?author_token=${user_token}`)
        .then((response)=>response.json())
        .then((data)=>{
            console.log(data);
            setIdeas(data);
        })
        .catch((err)=>
        {
            console.error(err.message);
        });
    }


    const navigate = useNavigate();
    
    const enterEdit = (idea) => {
        localStorage.setItem("current_idea", JSON.stringify(idea));
        console.log(idea.title);
        navigate("/edit");
    }
   
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
                <h2 className='homeTitle'>My Posts</h2>

                <div className='thread__container'>
                    {ideas.map((thread) => (
                        <div className='thread__item' key={thread.id} onClick={()=>{enterEdit(thread);}}>
                            <p>{thread.title}</p>
                            <div className='react__container'>
                            <p>Last Updated: {dayjs(thread.updated_at).format("YYYY-MM-DD HH:mm:ss")}</p>
                            </div>
                        </div>
                    ))}
                </div>

            </main>
        </>
    );
};

export default Home;