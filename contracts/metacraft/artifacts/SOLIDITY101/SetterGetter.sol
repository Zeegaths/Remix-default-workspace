//SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract SetterGetter {
    string name;


    function setName (string calldata _name) external {
        name = _name;
    }
    function getName() external view returns (string memory) {
        return name;
    }
}