// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import "./blog.sol";
import "./management.sol";
import "./add.sol";


contract Factory {
    Database public database;
    SimpleBlog public simpleBlog;
    addNumbers public addition;
    

    function blog() public {
        simpleBlog = new SimpleBlog();
    }

    function management() public{
        database = new Database();
    }

    function add() public {
        addition = new addNumbers();
    }

}