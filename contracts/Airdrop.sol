// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


//The contract gives away a specified amount of tokens.

contract Airdrop{
    //state variables
    uint256 public totalGiveaway;
    uint256 public distributedAmount;    



//sets total amount of giveaway tokens
    constructor(uint256 _totalGiveaway) {
        totalGiveaway = _totalGiveaway;    
    }


    function giveAirdrop(address) public payable returns(uint) {
       require(distributedAmount < totalGiveaway, "Sorry the airdrop is closed");      
       return (distributedAmount += 1);
    }
}





















contract Calculator{
    int private num1;
    int private num2;

    constructor (int _num1, int _num2) {
        num1 = _num1;
        num2 = _num2;       
    }

    // function setvalue(uint no1, uint no2) public{
    //     num1 = no1;
    //     num2 = no2;
    // }

    function add() public view returns (int) { 
        return (num1 + num2);               
    }

    function subtract()public view returns (int) {
        return (num1 - num2);               
    }

    function divide()public view returns (int) {
        return(num1 / num2);               
    }
    function multiply() public view returns (int) {
        return(num1 * num2);               
    }

    // function getSum() public view returns (uint){        
    //     return sum;
    // }
          

}
