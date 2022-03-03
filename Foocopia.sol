SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

contract Foocopia{
    uint256 x;
    bool y;
    bool r;
    function Foo(uint256 _x){
        x = _x;
    }

    function baz(uint256 x, bool y) public pure returns(bool r){
        r = x>32 || y;
    }
}
