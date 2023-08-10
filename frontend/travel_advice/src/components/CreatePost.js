import React, { useEffect, useState } from "react";
import dayjs from 'dayjs';
import Nav from "./Nav";
import { useNavigate } from "react-router-dom";
import {Col, DatePicker, Form, Input, Row, Button, Space} from "antd"
import EditableTags from "../utils/EditableTags";

const { RangePicker } = DatePicker;

const CreatePost = () => {
    const user_token = localStorage.getItem("userToken");

    let idea = 
        { "title": "", 
        "author_token": user_token, 
        "destination": "", 
        "description": "", 
        "tags": [], 
        "start_date": dayjs().format("YYYY-MM-DD"), 
        "end_date": dayjs().format("YYYY-MM-DD")}



    const createThread = (newIdea) => {
        fetch("http://localhost:8000/ideas/create/", {
            method: "POST",
            body: JSON.stringify(newIdea),
            headers: {
                "Content-Type": "application/json",
            },
        })
            .then((res) => {
                console.log(res.status);
                console.log(res);
                return res.json();
            })
            .then((data) => {
                console.log(data);
                alert("Post created");
                navigate("/dashboard");
            })
            .catch((err) => console.error(err));
    };

    
    
    console.log(idea);


    const navigate = useNavigate();



    // useEffect(fetchPostToEdit, []);

    const updateTags = (updatedList) => {
        idea.tags = updatedList;
        console.log("these are new tags: ", idea.tags); //logs the last tag list as the page is not yet rerendered
    }

    //onFinish of the form when clicking submit
    const updateIdea = (values) => {
        console.log(values);

        idea["title"] = values["title"];
        idea["description"] = values["description"];
        idea["destination"] = values["destination"];
        console.log("this is the new idea: ", idea);
        createThread(idea);
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



    return (
        <>
            <Nav />
            <main className="editPostContainer">
                <h2 className='homeTitle'>Create Post</h2>
            
                <Form name="ideaEditor" 
                onFinish={updateIdea}
                >
                    <Space direction="vertical" size="small">
                        <Form.Item name="title" label="Title" labelCol={{ span: 24 }}  rules={[
                                {
                                required: true,
                                message: 'Empty title is not allowed!',
                                },
                            ]}>
    
                                <Input maxLength={255}/>

                        </Form.Item>

                        <Form.Item name="description" label="Description" labelCol={{ span: 24 }} rules={[
                                {
                                required: true,
                                message: 'Empty description is not allowed!',
                                },
                            ]}>
                            
                                <Input.TextArea showCount cols={50} rows={10} />
                          
                        </Form.Item>

            
                            <Row>
                                <Space>
                                    <Form.Item name="destination" label="Destination" labelCol={{ span: 24 }}  rules={[
                                {
                                required: true,
                                message: 'Empty destination is not allowed!',
                                },
                            ]}>
                                        <Input maxLength={255}/>
                                    </Form.Item>
                    
                                    <RangePicker showToday defaultValue={[dayjs(), dayjs()]} onChange={updateDates}/>
                            
                                </Space>
                            </Row>
                            <Space direction="vertical" size="large">
                                <Row>
                                    <EditableTags tagList={idea.tags} updateTags={updateTags} />
                                </Row>

                                <Row>
                                    <Space>
                                        <Button type="primary" htmlType="submit">Create</Button>
                                        <Button type="primary" danger onClick={cancelEdit}>Cancel</Button>
                                    </Space>
                                </Row>
                            </Space>
                        </Space>
                </Form>
            </main>
        </>
    );

}


export default CreatePost;
