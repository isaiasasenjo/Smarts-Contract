// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A version of admins with a mapping
contract Fabrication {
    uint256 public units;
    address public owner;
    mapping (address => bool) public admins;
    uint256 lastChange;

    constructor(uint256 initialUnits) {
        owner = msg.sender;
        units = initialUnits;
        lastChange = block.timestamp;
    }
   
    modifier isOwner() {
        require(msg.sender == owner, "You are not allowed");
        _;
    }
    modifier isAuthorized() {
        require(admins[msg.sender] == true || msg.sender == owner);
        _;
    }

    modifier isTimeOk() {
        require(block.timestamp > lastChange + 20, "Not enough time" );
        lastChange = block.timestamp;
        _;
    } 

    function setUnits(uint256 newUnits) external isAuthorized isTimeOk {
        units = newUnits;
    }

    function incrementUnits(uint256 increment) external isAuthorized isTimeOk {
        units = units + increment;
    }
    function addAdmin(address newAdmin) external isOwner {
        admins[newAdmin] = true;
    }

    function removeAdmin(address _admin) external isOwner {
                admins[_admin] = false;
       }

}
