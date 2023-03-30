// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleICO {
  uint256 public totalSupply = 10**22;
  uint256 public tokenSwap = 10; // tokens per wei, 1000 Ethers
  uint256 public supply = 0; // tokens sold
  mapping (address => uint256) private balance; // owner-token
  modifier isTokenAvailable () {
    require (msg.value*tokenSwap + supply <= totalSupply);
    _;
  }
 // continues ...
 
 function balanceOf (address _tokenHolder) external view returns (uint256) {
 return balance[_tokenHolder];
 }

 function _buyTokens() internal isTokenAvailable {
 uint256 tokensAmount = msg.value * tokenSwap; // msg.value is in wei.
 balance [msg.sender] += tokensAmount;
 supply += tokensAmount;
 assert(supply <= totalSupply);
 }

 function buyTokens () external payable {
 _buyTokens();
 }
}
