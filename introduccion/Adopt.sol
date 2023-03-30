// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Adopt {

Adoption[16] public adoptions;

   struct Adoption {
     address owner;
     uint256 date;
   }

  function adopt(uint256 _petId) public {
     require(_petId >= 0 && _petId <= 15);
     require(adoptions[_petId].owner == address(0));
     adoptions[_petId] = Adoption(msg.sender, block.timestamp);
  }

  function returnToShelter(uint256 _petId) public {
     require (adoptions[_petId].owner == msg.sender);
     require (block.timestamp < adoptions[_petId].date + 3 minutes);
     adoptions[_petId] = Adoption(address(0),0);
  }
}
