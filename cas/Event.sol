// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract NFTGatedEvent {
    struct {

        uint ID;
        string name;
        string description;
        string venue;
        string date;
        address[] registeredUsers;
        bool isRegistered;               
    }
    
}