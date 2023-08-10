import React, { useEffect, useState } from "react";
import Nav from "./Nav";
import { useNavigate } from "react-router-dom";
import {Button,  Form, Input, Select,  InputNumber, Typography} from 'antd';

const {Text} = Typography;

const { Option } = Select;



const ExchangeRates = () => {


    const [result, setResult] = useState("0.00");






    const navigate = useNavigate();

    
    const convertCurrency = (value) => {
        fetch('https://community-neutrino-currency-conversion.p.rapidapi.com/convert',
            {
                method: 'POST',
                headers: {
                    'content-type': 'application/x-www-form-urlencoded',
                    'X-RapidAPI-Key': '3d6c64329cmshf5aaddfc4949c88p137a52jsn159af5c687c7',
                    'X-RapidAPI-Host': 'community-neutrino-currency-conversion.p.rapidapi.com'
                },
                body: new URLSearchParams({
                    'from-value': value["amount"].toString(),
                    'from-type': value["from"],
                    'to-type': value["to"]
                })
            }
        )
        .then((res)=>{
            console.log(res.status);
            return res.json()
        })
        .then((data)=>{
            console.log(data);
            setResult(data["result"]);
        })
    }

    return (
        <>

            <Nav />
            <main className="exchangeContainer">
            <Form name="currency_convertion" 
                onFinish={convertCurrency} >
                <Form.Item
                    name="from"
                    label="Currency to convert from"
                    rules={[
                    {
                        required: true,
                    },
                    ]}
                >
                    <Select
                        placeholder="Select a currency"
                        onChange={()=>{}}
                        allowClear
                    >
                        <Option value="HKD">HKD</Option>
                        <Option value="CNY">CNY</Option>
                        <Option value="GBP">GBP</Option>
                        <Option value="NZD">NZD</Option>
                        <Option value="USD">USD</Option>
                        <Option value="RUB">RUB</Option>
                        <Option value="EUR">EUR</Option>
                        <Option value="JPY">JPY</Option>
                        <Option value="KRW">KRW</Option>
                    </Select>
                </Form.Item>

                <Form.Item
                    name="to"
                    label="Currency to convert to"
                    rules={[
                    {
                        required: true,
                    },
                    ]}
                >
                    <Select
                        placeholder="Select a currency"
                        onChange={()=>{}}
                        allowClear
                    >
                        <Option value="HKD">HKD</Option>
                        <Option value="CNY">CNY</Option>
                        <Option value="GBP">GBP</Option>
                        <Option value="NZD">NZD</Option>
                        <Option value="USD">USD</Option>
                        <Option value="RUB">RUB</Option>
                        <Option value="EUR">EUR</Option>
                        <Option value="JPY">JPY</Option>
                        <Option value="KRW">KRW</Option>
                    </Select>
                </Form.Item>

                <Form.Item
                    name="amount"
                    label="Amount"
                    rules={[
                    {
                        required: true,
                    },
                    ]}
                >
                    <InputNumber></InputNumber>
                </Form.Item>

                <Button type="primary" htmlType="submit">Convert</Button>
            </Form>

            <Text strong>Result: {result}</Text>

        </main>

   
            
        </>
    );

}


export default ExchangeRates;