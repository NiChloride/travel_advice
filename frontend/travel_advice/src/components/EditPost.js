import React, { useEffect, useState } from "react";
import dayjs from 'dayjs';
import Nav from "./Nav";
import { useNavigate } from "react-router-dom";
import {Col, DatePicker, Form, Input, Row, Button, Space} from "antd"
import EditableTags from "../utils/EditableTags";

const { RangePicker } = DatePicker;

const EditPost = () => {

    // const [title, setTitle] = useState("placeholder text");
    // const [destination, setDestination] = useState("placeholder text");
    // const [description, setDescription] = useState("placeholder text");
    const [tags, setTags] = useState(["placeholder tag"]);
    // const [start_date, setStart_date] = useState("1970-01-01");
    // const [end_date, setEnd_date] = useState("1970-01-01");
    const [dateRange, setDateRange] = useState(["1970-01-01", "1970-01-02"]); 

    let idea = JSON.parse(localStorage.getItem("current_idea"));
    const idea_id = idea.id;
    console.log(idea);






    const navigate = useNavigate();



   
    const updateTags = (updatedList) => {
        idea.tags = updatedList;
        console.log("these are new tags: ", idea.tags); //logs the last tag list as the page is not yet rerendered
    }

    //onFinish of the form when clicking submit
    const updateIdea = (values) => {
        console.log(values);
        let updatedIdea = JSON.parse(JSON.stringify(idea));
        updatedIdea["title"] = values["title"];
        updatedIdea["description"] = values["description"];
        updatedIdea["destination"] = values["destination"];
        updatedIdea["start_date"] = idea.start_date;
        updatedIdea["end_date"] = idea.end_date;
        updatedIdea["tags"] = idea.tags;

        // localStorage.setItem("current_idea", JSON.stringify(idea));


        console.log("this is the updated idea: ", updatedIdea);

        //send request to update the idea
        fetch(`http://localhost:8000/ideas/update/${idea_id}/`, {
            method: "POST",
            body: JSON.stringify(updatedIdea),
            headers: {
                "Content-Type": "application/json",
            },
        })
            .then((res) => {
                console.log(res.status);
                if(res.status==200){
                    alert("update sucessful")
                }
                console.log(res);
                return res.json();
            })
            .then((data) => {
                console.log(data);
                navigate("/profile")
            })
            .catch((err) => console.error(err));
    }

    //onFinish of the form when clicking cancel
    const cancelEdit = () => {
        navigate("/profile");
    }

    const updateDates = (value) => {
        // setDateRange([value[0].format("YYYY-MM-DD"),value[1].format("YYYY-MM-DD")]);
        idea.start_date = value[0].format("YYYY-MM-DD");
        idea.end_date = value[1].format("YYYY-MM-DD");
        console.log("new dateRange is: " + idea.start_date + " to "+ idea.end_date);
    }

    const deleteIdea = () => {
        fetch(`http://localhost:8000/ideas/${idea_id}/delete/`, {
            method: "DELETE",
        })
            .then((res) => {
                console.log(res.status);
                if(res.status==202){
                    alert("delete sucessful")
                }
                console.log(res);
                return res.json();
            })
            .then((data) => {
                console.log(data);
            })
            .catch((err) => console.error(err));

            navigate("/profile");
    }


    return (
        <>
            <Nav />
            <main className="editPostContainer">
                <h2 className='homeTitle'>Edit Post</h2>
            
                <Form name="ideaEditor" 
                onFinish={updateIdea}
                >
                    <Space direction="vertical" size="small">
                        <Form.Item name="title" label="Title" labelCol={{ span: 24 }} initialValue={idea.title}  rules={[
                                {
                                required: true,
                                message: 'Empty title is not allowed!',
                                },
                            ]}>
    
                                <Input maxLength={255}/>

                        </Form.Item>

                        <Form.Item name="description" label="Description" labelCol={{ span: 24 }} initialValue={idea.description} rules={[
                                {
                                required: true,
                                message: 'Empty description is not allowed!',
                                },
                            ]}>
                            
                                <Input.TextArea showCount cols={50} rows={10} />
                          
                        </Form.Item>

            
                            <Row>
                                <Space>
                                    <Form.Item name="destination" label="Destination" labelCol={{ span: 24 }} initialValue={idea.destination} rules={[
                                {
                                required: true,
                                message: 'Empty destination is not allowed!',
                                },
                            ]}>
                                        <Input maxLength={255}/>
                                    </Form.Item>
                    
                                    <RangePicker defaultValue={[dayjs(idea.start_date), dayjs(idea.end_date)]} onChange={updateDates}/>
                            
                                </Space>
                            </Row>
                            <Space direction="vertical" size="large">
                                <Row>
                                    <EditableTags tagList={idea.tags} updateTags={updateTags} />
                                </Row>

                                <Row>
                                    <Space>
                                        <Button type="primary" htmlType="submit">Submit</Button>
                                        <Button type="primary" danger onClick={cancelEdit}>Cancel</Button>
                                        <Button type="primary" danger onClick={deleteIdea}>Delete This Idea</Button>
                                    </Space>
                                </Row>
                            </Space>
                        </Space>

                </Form>
            </main>
        </>
    );

}


export default EditPost;
