// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0; 
contract SimpleRemotePurchase { 
	address payable public seller; 
	address public buyer; 
	constructor() {
  seller = payable (msg.sender);
	}

function depositPayment() public payable
{
 require (msg.value == 1 ether);
 require(buyer == address(0));
 buyer = msg.sender;
}

function confirmDelivery() public
{
 require(buyer != address(0));
 require (msg.sender == buyer);
 seller.transfer(1 ether);
}
}
