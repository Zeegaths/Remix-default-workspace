// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

library stakingLib {

    error INSUFFICIENT_BALANCE();
    error ADDRESS_ZER0_CHECK();
    error ZERO_AMOUNT();

    event SavingSuccessful(address indexed sender, address stakingContract, uint amount);

    



    function ADDRESS_ZER0_CHECKED(address _address) internal pure {
        if(_address == address(0)) {
            revert ADDRESS_ZER0_CHECK();
        }
    }

    function INVALID_AMOUNT (uint256 _amount) internal pure {
        if(_amount <= 0) {
            revert ZERO_AMOUNT();
        }
    }

    


}