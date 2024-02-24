// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// import "./IERC20.sol";
import "./token1.sol";
import "./token2.sol";

// interface IERC20 {
    
//     // function totalSupply() external view returns (uint256);

//     // function balanceOf(address acount) external view returns (uint);

//     // function transfer(address recipient, uint amount) external view returns (uint);

//     function allowance(address owner, address spender) external view returns (uint);

//     // function approve(address spender, uint amount) external returns (bool);

//     function transferFrom (address sender, address recipient, uint amount) external returns (bool);

//     // event Transfer(address indexed from, address indexed to, uint value);
//     // event Approval(address indexed owner, address indexed spender, uint value);
// }

// error SWAP_FAILED();

contract TokenSwap  {

    //state variables
    IERC20 public tokenA;
    address public owner1;
    IERC20 public tokenB;
    address public owner2;

    //mappings
    mapping(address => uint) public balanceOf;
    mapping(address => uint) tokens;
    // mapping(address => mapping(address => uint)) public allowance;


    constructor(address _tokenA, address _tokenB, address _owner1, address _owner2) {
        tokenA = IERC20(_tokenA);
        tokenB = IERC20(_tokenB);
        owner1 = _owner1;
        owner2 = _owner2;
}


    // function swapRate(uint x, uint y) private pure  returns (uint, uint) {
    //     x = y * 10;
    //     y = x / 10;
    //     return (x, y);
    // }

    function tokenSwap(uint amount1, uint amount2) external {  
        require (msg.sender == owner1 || msg.sender == owner2, "cannot transact");
        // require (tokenA.allowance(owner1, address(this)) >= amount1, "allowance too low");
        // require (tokenB.allowance(owner2, address(this)) >= amount2, "allowance too low");
          
        // require (allowance[tokenA][address(this)] >= amount1, "insufficient allowance");
        // require (allowance[tokenB][address(this)] >= amount2, "insufficient allowance");
        // swapRate(amount1, amount2);
    
        //  require(IERC20(tokenAContract).allowance(owner1, address(this)) >=  amount1, "insufficient allowance");
        // require(tokenB.allowance(address(this)) >= amount2, "insufficient allowance");

        // // require(IERC20(tokenBContract).allowance(owner2, address(this)) >=  amount2, "insufficient allowance");
        // if (IERC20(tokenAContract).transferFrom(owner1,owner2,amount1)) {
        //     IERC20(tokenBContract).transferFrom(owner2,owner1,amount2);
        // }else {
        //     return;
        // }
        
        transferTokens(tokenA, owner1, owner2, amount1);
        transferTokens(tokenB, owner2, owner1, amount2);      
        

    }    


    function transferTokens (IERC20 token, address from, address to, uint amount) private {
        bool success = token.transferFrom(from, to, amount);
        require(success, "transaction failed");

    }
   
} 


// token A: 0xd9145CCE52D386f254917e481eB44e9943F39138
// owner 1: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4


// token B: 0xAc40c9C8dADE7B9CF37aEBb49Ab49485eBD3510d
// owner2: 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2

// swap: 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
