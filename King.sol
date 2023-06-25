// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Attack {

    address payable to = payable(address());

    function attack() public payable {
        
        to.call{value: msg.value}('');
    }

}

/**
 * 不写fallback/receive就接收不了eth
 */