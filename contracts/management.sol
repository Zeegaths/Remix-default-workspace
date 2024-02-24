// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract Database{
    struct Employee{
        uint ID;
        string Name;        
    }
   
   mapping (address => Employee) employeeData;
    uint private nextID;

   function addEmployee(string memory _Name) public {
        uint ID = nextID;
        employeeData[msg.sender] = Employee(ID, _Name);
        nextID++;
   }
}