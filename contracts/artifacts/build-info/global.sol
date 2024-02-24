// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract Global {
    address public sender; // SPDX-License-Identifier: MIT
    uint public value;

    function assignValues() external payable{
        sender = msg.sender;
        value = msg.value;
    }
}
   