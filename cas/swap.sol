// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// import "./IERC20.sol";
import "./token1.sol";
import "./token2.sol";


contract TokenSwap  {

    //state variables
    IERC20 public tokenA;
   
    IERC20 public tokenB;
   

    //mapping
    mapping(address => uint) public balanceOf;


    event Transfer(address indexed from, address indexed to, uint value);  


    constructor(address _tokenA, address _tokenB) {
        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);        
}


    function tokenSwap1(uint amount1) external {  
        uint amount2 = amount1 * 10; 

        require (tokenA.allowance(msg.sender, address(this)) >= amount2, "allowance too low");   

        require (tokenA.balanceOf(address(this)) >= amount2, "insufficient funds");
        

        IERC20(tokenA).transferFrom(msg.sender, address(this), amount1);

        IERC20(tokenB).transfer(msg.sender, amount2); 

        emit Transfer(address(this), msg.sender, amount2);
    } 

    

    function tokenSwap2(uint amount2) external {

        require(amount2 >= 10, "amount has to be greater than 10");

        uint amount1 = amount2 / 10;

        require (tokenA.allowance(msg.sender, address(this)) >= amount1, "allowance too low");        
        
        require (tokenA.balanceOf(address(this)) >= amount1, "insufficient funds");

        IERC20(tokenB).transferFrom(msg.sender, address(this), amount2);

        IERC20(tokenA).transfer(msg.sender, amount1);   

        emit Transfer(address(this), msg.sender, amount1); 
    }

    

      


}
//tokenA: 0xb27A31f1b0AF2946B7F582768f03239b1eC07c2c
//tokenB: 0xB34db0d5aA577998c10c80d76F87AfE58b024e5F

//owner1: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
//owner2: 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2

//swap: 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db