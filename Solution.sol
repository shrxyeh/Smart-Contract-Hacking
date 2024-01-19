//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Vulnerable{
    bool lock;

    mapping(address=>uint)public balances;

    function deposit()public payable{
        balances[msg.sender]+=msg.value;
    }

    function withdraw()public 
    {
        //Lock the codeblock
        require(lock==false,"Locked");
        lock=true;

        uint bal=balances[msg.sender];
        require(bal>0);

        (bool sent,)=msg.sender.call{value:bal}("");
        require(sent,"Failed to send Ether");

        lock=false;
        //unlock the codeblock after execution

    }

}
