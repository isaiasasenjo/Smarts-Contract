// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract PetAuction2 {

Adoption[16] public adopters;

 struct Adoption{
   address owner;
   uint256 date;
   uint256 bid;
 }

 function bid(uint256 _petId, uint256 _bid) public {
   require(_petId >= 0 && _petId <= 15);
   require (now < adopters[_petId].date + 5 minutes || adopters[_petId].date == 0 );
   require (_bid > adopters[_petId].bid || adopters[_petId].bid == 0 );
   adopters[_petId] = Adoption(msg.sender, block.timestamp, _bid);
 }
}
