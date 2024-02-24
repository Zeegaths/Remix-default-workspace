// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract MyGame {

    uint public playerCount = 0; 
    mapping (address => Player) public players;
   
    enum Level {Novice, Intermediate, Pro}
    struct Player {
        address playerAddress;
        Level playerLevel;
        string firstName;
        string lastName;
    }

    function addPlayer (string memory firstName, string memory lastName) public {
        players[msg.sender] = Player(msg.sender, Level.Novice, firstName, lastName);
        playerCount += 1;
    }

    function findPlayerLevel (address playerAddress) public view returns(Level) { 
        return players[playerAddress].playerLevel;
    }
}


// struct  person {
//     uint age;
//     bool complexity;
// }
//     mapping(address => person) student;

//  function setStruct (uint _age, bool _)