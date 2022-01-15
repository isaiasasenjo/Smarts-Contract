// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fabrication {
    uint256 public units;
    address public owner;
    address[] public admins;
    uint256 public lastOrderTimestamp;
    
    constructor(uint256 initialUnits){ // only executed once, when the SC is deployed
        owner = msg.sender;
        units = initialUnits;
        lastOrderTimestamp = block.timestamp;
    }

    modifier isOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    modifier isAuthorized() {
        bool isValid;
        for(uint256 i=0; i<admins.length && isValid == false ; i++){
            if(msg.sender == admins[i] || msg.sender == owner) {
                _;
                isValid = true;
            }
        }
    require(isValid);
    }

    function addAdmin(address newAdmin) public isOwner {
        admins.push(newAdmin);
    }

    function removeAdmin(address newAdmin) public isOwner {
        // Buscar y reemplazar por 0.
        for(uint256 i=0; i<admins.length ; i++){
            if(newAdmin == admins[i]) {
                admins[i] = address(0); // nos devuelve gas!!!
            }
        }  
    }


    function setUnits(uint256 newUnits) public  {
        require(block.timestamp > lastOrderTimestamp + 20,"not enough time");
        // acciones
        units = newUnits;
        lastOrderTimestamp = block.timestamp;
    }
}
