// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract SelfDestructContract {
    address public owner;

    constructor() public payable{
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function performAction(uint _amount) public onlyOwner {
        payable(msg.sender).transfer(_amount);       
    }

    function selfDestruct(address _address) public onlyOwner {
        // Ensure the self-destruct function is only called by the owner
        selfdestruct(payable(_address));
    }

    receive() external payable{}
}
