
import { AiFillAlipayCircle } from "react-icons/ai";
import React, { useContext } from "react";
import { SiEthereum } from 'react-icons/si';
import { BsInfoCircle } from 'react-icons/bs';

import { Loader } from ".";

const CommonStyles = "min-h-[70px] sm:px-0 px-2 sm:min-w-[120px] flex justify-center items-center border-[0.5px] border-gray-400 text-sm font-light text-white";

const Welcome = () => {
    const handleSumbit = () => {

    }

    const Input = ({placeholder, name, type, value, handle}) => (
        <input
            placeholder={placeholder} 
            type={type}
            step="0.0001"
            value={value}
            onChange={(e)=> handleChange(e,name)}
            className="my-2 w-full rounded-sm p-2 outline-none bg-transparent text-white border-none text-sm white-glassmorphism"
        />
     );
    const connectWallet = () =>{

    }

    return (
        <div className = "flex w-full justify-center" items-center>
            <div className="flex mf:flex-row flex-col items-start justify-between md:p-20 py-12 px-4">
                <div className="flex flex-1 justify-start flex-col mf:mr-10">
                    <h1 className="text-3x1 sm:text-5x1 text-white text-gradient py-1">
                    Send Crypto <br /> across the word    
                    </h1>
                    <p className="text-left mt-5 text-white font-light md:w9/12 w-11/12 text-base ">
                        Explore the crypto world. Buy and sell cryptocurrencies easily on CriptoGiff
                    </p>
                    <button
                    type="button"
                     onClick={connectWallet}
                     className="flex flex-row justify-center items-center my-5 bg-[#2952e3] p-3 rounded-full cursor-pointer hover:bg-[#2546bd]"
                     >
                    <p className="text-white text-base font-semibold">
                    Connect Wallet
                    </p>
                    </button>
                    <div className="grid sm:grid-cols-3 grid-cols-2 w-full mt-10">
                        <div className={`rounded-tl-2xl ${CommonStyles}`}>Reliability</div>
                        <div className={CommonStyles}> Security</div>
                        <div className={`rounded-tr-2xl ${CommonStyles}`}> Etereum</div>
                        <div className={`rounded-bl-2xl ${CommonStyles}`}> Web 3.0</div>
                        <div className={CommonStyles}> Low fees </div>
                        <div className={`rounded-br-2xl ${CommonStyles}`}> Blockchain</div>
                    </div>
                </div>
                <div className="flex flex-col flex-1 items-center justify-start w-full mf:mt-0 mt-10">
                    <div className="p-3 flex justify-end items-start flex-col rounded-xl h-40 sm:w-72 w-full my-5 eth-card .white-glassmorphism ">
                        <div className="flex justify-between flex-col w-full h-full">
                            <div className="flex justify-between items-start">
                                <div className="w-10 h-10 rounded-full border-2 border-white flex justify-center items-center">
                                    <SiEthereum fontSize={21} color="#fff" />
                                </div>
                                    <BsInfoCircle fontSize={17} color="#fff" />
                            </div>
                                <p className="text-white font-light text-sm">
                                    Ethereum
                                </p>
                                <p className="text-white font-light text-sm">
                                    Ethereum
                                </p>
                        </div>
                    </div>
                    <div className=" p-5 sm:w-96 w-full flex flex-col justify-start items-center blue-glassmorphism">
                        <Input placeholder="Address To" name="addressTo" type="text" handleChange={() => {}} />
                        <Input placeholder="Amount (ETH)" name="amount" type="number" handleChange={() => {}} />
                        <Input placeholder="Keyword (Gif)" name="keyword" type="text" handleChange={() => {}} />
                        <Input placeholder="Enter Message" name="message" type="text" handleChange={() => {}} />
                        <div className="h-[1px] w-full bg-gray-400 my-2" />
                        {false
                        ? (<Loader />)
                        : (
                        <button
                        type="button"
                        onClick= {handleSumbit}
                        className="text-white w-full mt-2 border-[1px] p-2 border-[#3d4f7c] hover:bg-[#3d4f7c] rounded-full cursor-pointer"
                        >
                            Send now
                        </button>
                        )}
                    </div>
                </div>
            </div> 
        </div>

    );
}

export default Welcome;