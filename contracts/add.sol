// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

contract addNumbers {
    uint public x= 1;

    //view functions do not modify state
    function addToX(uint y) public view returns (uint) {
        return x + y;
    }

    //pure functions neither read or modify state
    function add(uint i, uint j) public pure returns (uint) {
        return i + j;
    }
}