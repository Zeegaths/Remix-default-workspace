// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Vault {  

    address beneficiary;
    uint duration;
    uint allocation;
    uint unlockTime;

    uint public totalSupply;

    mapping(address => uint) public balanceOf;


    function grantBeneficiary(uint _duration, address _beneficiary) external payable {

        duration = _duration;

        unlockTime = block.timestamp + duration;

        beneficiary = _beneficiary;

        allocation = msg.value;

        // balanceOf[msg.sender] -= allocation;

        totalSupply += totalSupply;

        payable(address(this)).transfer(allocation);
    }


    function claimGrant() external {
        require(msg.sender == beneficiary, "not eligible");

        require(block.timestamp >= unlockTime, "not yet time");

        totalSupply -= allocation;

        payable(msg.sender).transfer(allocation);
    }

    receive() external payable {}

    fallback() external payable { }

}