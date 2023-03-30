// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleRemotePurchase1 {
enum State {AWAITING_PAYMENT, AWAITING_DELIVERY, COMPLETE}
State currentState;
address buyer;
address payable seller;

 modifier buyerOnly() { require(msg.sender == buyer); _; }
 modifier inState(State expectedState)
 { require (currentState == expectedState); _;}

 constructor(address _buyer, address payable _seller) {
 buyer = _buyer;
 seller = _seller;
 }
 function depositPayment() public payable buyerOnly inState(State.AWAITING_PAYMENT) {
	currentState = State.AWAITING_DELIVERY;
 }
 function confirmDelivery() public buyerOnly inState(State.AWAITING_DELIVERY) {
	seller.transfer(address(this).balance);
	currentState = State.COMPLETE;
 }
}
