SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Test{
    uint256 a=2;
    uint256 b=3;
    uint256 public c;
    constructor(){
        c = a & b;
    }
}
