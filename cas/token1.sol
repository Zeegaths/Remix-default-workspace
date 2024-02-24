
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract token1 is ERC20, Ownable{
    constructor() ERC20("ZarahToken", "ZTK") Ownable (msg.sender) {
        _mint(msg.sender, 5000000 *10 ** 18);
    }
}





// token A: 0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99
// owner 1: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4


// token B: 0xd9145CCE52D386f254917e481eB44e9943F39138
// owner2: 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2

// swap: 