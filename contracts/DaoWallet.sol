// SPDX-License-Identifier: MIT
pragma solidity 0.6.0;

contract DaoWallet {
    
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;        
    }

    function withdraw( uint _amount) public {
        require(balances[msg.sender] >= _amount);


        (bool sent, ) = msg.sender.call{value: _amount} ("");
        require(sent, "Money transfer failed");

        balances[msg.sender] -= _amount;

    }
    function getAccountBalance() public view returns(uint) {
        return address(this).balance;
    }

}