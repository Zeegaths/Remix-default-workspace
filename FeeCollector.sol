// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract FeeCollector {
    address public owner;
    uint256 public balance;

    constructor () {
        owner = msg.sender;
    }
    receive() payable external {
        balance += msg.value;
    }
    function withdraw(uint amount, address payable destAddr) public {
        require(msg.sender == owner, "You have to be the owner to install");
        require(amount <= balance, "Insufficient funds");
        destAddr.transfer(amount);
        balance -= amount;
    }
    
}