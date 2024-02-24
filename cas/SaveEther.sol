// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

contract SaveEther {
    
    mapping (address => uint256) savings;

    event saveSuccessiful(address indexed user, uint256 indexed value);
    function deposit () external payable {
        require(msg.sender != address(0));
        require(msg.value > 0, "enter a valid amount");
        savings[msg.sender] = savings[msg.sender] + msg.value;

        emit saveSuccessiful (msg.sender, msg.value);
    }

    function withdraw () external payable {
        require(msg.sender != address(0));

        uint256 _userSavings = savings[msg.sender];

        require(_userSavings > 0, "no enough balance");

        savings[msg.sender] -= _userSavings;

        payable(msg.sender).transfer(_userSavings);     
    }

    function sendSavings (address _receiver, uint _amount) external {
        require (_receiver != address(0), "Invalid address");
        require (_amount > 0, "You cant send zero");
        require (savings[msg.sender] > _amount, "insufficient funds");

        payable(_receiver).transfer(_amount);
    }

    function checkBalance (address _user) external view returns (uint){
        return savings[_user];
    }

    function checkContractBalance () external view returns(uint) {
        return address(this).balance;
    }
}
