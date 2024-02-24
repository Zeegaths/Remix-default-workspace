
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
 
contract StudentRegister{    

    struct Students{
        string Name;
        uint8 Age;        
    }

//mapping address to struct
    mapping(address => Students) details;


    function registerStudent(string memory _name, uint8 _age)  public {
        require (_age > 18 ,"sorry you have to be an adult to be an adult");
        assert (_age != 0);
        if( _age > 35 ) {
            revert ("sorry, we only take applicants below 35 years");
        }
        details[msg.sender] = Students(_name, _age);
    }

}