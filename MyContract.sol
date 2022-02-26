// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract C {
    uint256 public x;
    uint256 public y;

    function fourTimesTwo() public{
        assembly {
            sstore (1, mul(4,2))
        }
    }
}
