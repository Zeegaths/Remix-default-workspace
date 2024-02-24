// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Write a smart contract that defines and triggers 3-4 events
// Index the events so that they can be easily searched
// Capture these events in your JavaScript code

contract Events {
   uint public x = 0;
   event AddressLog(address indexed sender, string message);
   event DepositAmount(address indexed _from, uint _value, string message);
   event ValueIncrease(address indexed owner, uint oldValue, uint newValue, string message);

   function checkEvents() public payable {
    emit AddressLog(msg.sender, "Log message emitted");
    emit DepositAmount(msg.sender, msg.value, "Deposit successful");
   }

    function addAmount() public {
        uint oldValue = x;
        x++;
        emit ValueIncrease(msg.sender, oldValue, x, "Value increased");
    }
}