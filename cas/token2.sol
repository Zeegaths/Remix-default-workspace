
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract token2 is ERC20, Ownable{
    constructor() ERC20("MamaToken", "MTK") Ownable (msg.sender) {
        _mint(msg.sender, 5000000 *10 ** 18);
    }
}