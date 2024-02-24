// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;

contract FunctionIntro {
    function add (uint x, uint y) external pure returns(uint) {
        return x + y;
    }
    function subtract (uint x, uint y)  external pure returns(uint) {
        return x - y;
    }

}