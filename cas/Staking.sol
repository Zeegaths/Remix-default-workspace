// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./IERC20.sol";
import "./stakingLib.sol";

contract Staking {
    using stakingLib for *;

    address public stakeToken;
    address public rewardToken;
    uint public totalSupply;
    uint public duration;

    mapping(address => uint) public balanceOf;
    mapping(address => uint) public stakeTime;
    mapping(address => uint) public rewards;

    event StakingSuccessful(address indexed user, uint amount);

    constructor(address _stakeToken, address _rewardToken) {
        stakeToken = _stakeToken;
        rewardToken = _rewardToken;
    }

    function stake(uint _amount) external {
        stakingLib.ADDRESS_ZERO_CHECKED(msg.sender);
        stakingLib.INVALID_AMOUNT(_amount);

        require(IERC20(stakeToken).balanceOf(msg.sender) >= _amount, stakingLib.INSUFFICIENT_BALANCE());

        IERC20(stakeToken).transferFrom(msg.sender, address(this), _amount);

        balanceOf[msg.sender] += _amount;
        totalSupply += _amount;
        stakeTime[msg.sender] = block.timestamp;

        emit StakingSuccessful(msg.sender, _amount);
    }

    function calculateReward(uint _amount) private view returns (uint) {
        uint time = block.timestamp - stakeTime[msg.sender];
        uint annualReward = (_amount * 10) / 1000; // 10% APY
        uint reward = (time * annualReward) / 365 days;
        return reward;
    }

    function claimReward() external {
        uint totalRewards = calculateReward(balanceOf[msg.sender]);

        IERC20(rewardToken).transfer(msg.sender, totalRewards);
        rewards[msg.sender] += totalRewards;
    }

    function withdraw(uint _amount) external {
        require(balanceOf[msg.sender] >= _amount, stakingLib.INSUFFICIENT_WITHDRAW_BALANCE());

        balanceOf[msg.sender] -= _amount;
        totalSupply -= _amount;
        IERC20(stakeToken).transfer(msg.sender, _amount);
    }

    function unstake() external {
        uint totalReward = rewards[msg.sender];
        uint totalStake = balanceOf[msg.sender];

        rewards[msg.sender] = 0;
        balanceOf[msg.sender] = 0;

        IERC20(stakeToken).transfer(msg.sender, totalStake);
        IERC20(rewardToken).transfer(msg.sender, totalReward);
    }
}



// pragma solidity ^0.8.24;

// import "./IERC20.sol";
// import "./stakingLib.sol";

// contract Staking {
//     using stakingLib for *;

//     address public stakeToken;
//     address public rewardToken;
//     uint public totalSupply;
//     uint public duration;

//     mapping(address => uint) public balanceOf;
//     mapping (address => uint) public stakeTime;
//     mapping(address => uint) public rewards;
    

//     constructor(address _stakeToken, address _rewardsToken) {
//         stakeToken = _stakeToken;
//         rewardToken = _rewardsToken;

//     }

//     function stake( uint _amount) external { 

//         stakingLib.ADDRESS_ZER0_CHECKED(msg.sender);

//         stakingLib.INVALID_AMOUNT(_amount); 

//         if(IERC20(stakeToken).balanceOf(msg.sender) < _amount) {
//             revert stakingLib.INSUFFICIENT_BALANCE();
//         }        

//         IERC20(stakeToken).transferFrom(msg.sender, address(this), _amount);
        
//         balanceOf[msg.sender] = balanceOf[msg.sender] + _amount;

//         totalSupply = totalSupply + _amount;  

//         stakeTime[msg.sender] = block.timestamp;

//         emit stakingLib.SavingSuccessful(msg.sender, address(this), _amount);   


//     } 
//     //  function contractBalance() external view returns (uint) {
//     //     // return IERC20(myToken).balanceOf(address(this));

//     //  }

//     function calculateReward(uint _amount) private view returns(uint) {

//         uint time = block.timestamp - stakeTime[msg.sender];

//         uint annualReward =  (_amount * 10) / 1000; // 10% APY

//         uint reward = (time * annualReward) / 365 days;
//         return reward;        
//     }

//     function claimReward() external {
//         uint totalRewards =calculateReward(balanceOf[msg.sender]);
            
//         IERC20(rewardToken).approve(msg.sender, totalRewards);       
        
//         // balanceOf[msg.sender]
//         IERC20(rewardToken).transferFrom(address(this), msg.sender, totalRewards);
//         rewards[msg.sender] = rewards[msg.sender] - totalRewards;
        
//     }

//     function withdraw(uint _amount) external { 
//         balanceOf[msg.sender] -= _amount;
//         totalSupply -= _amount;       
//         IERC20(stakeToken).transfer(msg.sender, _amount);  
//     }


//     function unstake() external {

//        uint totalReward = rewards[msg.sender];
//        uint totalStake = balanceOf[msg.sender];

//        rewards[msg.sender] = 0;
//        balanceOf[msg.sender] = 0;

//         IERC20(stakeToken).transfer(msg.sender, totalStake);
//         IERC20(rewardToken).transfer(msg.sender, totalReward);             

//     }
// }