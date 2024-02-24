// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Staking {
    struct Staker {
        uint stakeCount;
        uint amount;
        uint stakeDuration;
        uint reward;
    }
    mapping (address => Staker) public stakers;

    function calculateReward(uint _amount, uint _stakedTime) private view returns(uint) {
        require(_stakedTime < block.timestamp, "Go home");
        uint totalSec = block.timestamp -_stakedTime;
        uint secToDay = totalSec / 86400;
        uint reward = addReward(_amount) * secToDay;
        return reward;
    }
    
    function addReward(uint _amount) internal pure returns(uint) {
        return _amount * 1/5000;
    }
    
}
