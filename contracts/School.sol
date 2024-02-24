//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

contract School {
    enum Rank {
        Principle,
        Teacher,
        Student
    }

    struct Person {       
        string Name;
        uint Age;
        uint Score; 
        address Account;
        Rank rank;
    }
    

    address public principle;

    // contract IterableMapping {    mapping(uint => address) someList;
    // uint public totalEntries = 0;    function addToList() public returns(uint) {
    //     someList[totalEntries] =
    //         address(0xABaBaBaBABabABabAbAbABAbABabababaBaBABaB);
    //     return ++totalEntries;
    // }}
    

    mapping(address => mapping(Rank => Person)) private database;  

    constructor() {
        principle = msg.sender;
    }


    modifier onlyPrinciple {
        require(principle == tx.origin, "Only principle have full access");
        _;
    } 

    modifier onlyTeacher {
        require(database[msg.sender][Rank.Teacher].Account == msg.sender, "Only teacher can update score");
        _;
    } 

    function registerStudent (address _studentAddress, string memory _name, uint _age, uint _score) onlyPrinciple public {        
        database[_studentAddress][Rank.Student] = Person(_name, _age, _score, _studentAddress, Rank.Student);
        
    }

    function registerTeacher (address _teacherAddress, string memory _name, uint _age, uint _Score) public onlyPrinciple { 
        database[_teacherAddress][Rank.Teacher] = Person(_name, _age, _Score, _teacherAddress, Rank.Teacher);        
    }
  

    function updateScore(address _studentAddress, uint sscore) public onlyTeacher {
        database[_studentAddress][Rank.Student].Score = sscore;                       
    }


    function removeTeacher( address _teacherAddress) public onlyPrinciple {        
        database[_teacherAddress][Rank.Teacher].Account = _teacherAddress;
        delete(_teacherAddress);      

    }
    
    
}
