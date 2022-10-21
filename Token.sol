// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IToken{
    function transfer(address, uint) external returns(bool);
}

contract Token{
    address Instance;

    constructor(address _level) {
        Instance = _level;
    }

    function task() public {
        IToken(Instance).transfer(msg.sender, 50);
    }
}