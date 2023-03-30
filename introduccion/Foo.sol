// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Foo{
    uint256 public x;
    bool public r;
    bool public y;
    address public owner;
    uint256 public balance;
   
    constructor(uint256  x1, bool y1){
        y = y1;
        x = x1;
        owner = msg.sender;
        balance =  msg.sender.balance;
      }

    function set_x_y (uint256 _x, bool _y) public{
        x = _x;
        y = _y;
    }
  
    function baz1() public returns(bool){
        r = (x>20 || y);
        return r;
    }
}
