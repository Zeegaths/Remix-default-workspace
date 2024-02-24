// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
 
 contract Counter {
    uint public count;  
    

    function add() public returns (uint) {
        return count += 1;
    }

    function sub() public returns (uint) {
        return count -= 1;
    }

    function getCount() public view returns (uint) {
        return count;
    }
 }