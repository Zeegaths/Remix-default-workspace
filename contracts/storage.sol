//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract Storage {
    struct student{
        string Name;
        uint Age;
    }

    mapping (address => student) students;

    //gets the age of the student
    function calculateAge ( uint _yearofbirth, uint _currentYear) public returns (uint) {
        students[msg.sender].Age = _currentYear - _yearofbirth;
        return students[msg.sender].Age;
    }
}