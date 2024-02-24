// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "./IERC20.sol";

// interface IERC20 {
    
//     function totalSupply() external view returns (uint256);

//     function balanceOf(address acount) external view returns (uint);

//     function transfer(address recipient, uint amount) external view returns (uint);

//     function allowance(address owner, address spender) external view returns (uint);

//     function approve(address spender, uint amount) external returns (bool);

//     function transferFrom (address sender, address recipient, uint amount) external returns (bool);

//     event Transfer(address indexed from, address indexed to, uint value);
//     event Approval(address indexed owner, address indexed spender, uint value);
// }


contract TokenSwap  {

    //state variables
    address public tokenA;    
    address public tokenB;

    address public owner1;
    address public owner2;

    //mappings
    mapping(address => uint) balanceOf;
    // mapping(address => mapping(address => uint)) public allowance;


    constructor(address _tokenA, address _tokenB, address _owner1, address _owner2) {
        tokenA = _tokenA;
        tokenB = _tokenB;
        owner1 = _owner1;
        owner2 = _owner2;
    }

    function transferTokens (address from, address to, uint amount) public{
        bool success = IERC20(tokenA).transferFrom(from, to, amount);
        require(success, "transaction failed");

    }

    // function swapRate(uint x, uint y) private pure {
    //     x = y * 10;
    //     y = x / 10;
    // }

    function tokenSwap(uint amount1, uint amount2) external {  
        // require(amount2 > 10, "balance too low");      
        // // require (allowance[tokenA][address(this)] >= amount1, "insufficient allowance");
        // // require (allowance[tokenB][address(this)] >= amount2, "insufficient allowance");
        // swapRate(amount1, amount2);
    
        require(IERC20(tokenA).allowance(tokenA, address(this)) >=  amount1, "insufficient allowance");
        // require(tokenB.allowance(address(this)) >= amount2, "insufficient allowance");

        require(IERC20(tokenB).allowance(tokenB, address(this)) >=  amount2, "insufficient allowance");

        IERC20(tokenA).transferFrom(owner1,owner2,amount1);
        IERC20(tokenB).transferFrom(owner2,owner1,amount2);

    }    
} 
