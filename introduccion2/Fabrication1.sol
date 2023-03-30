// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// A version of admins with an array
contract Fabrication1 {
    uint256 public units;
    address public owner;
    mapping (address => bool) public admins;
    uint256 lastChange;
    uint256 changePeriod;

    constructor(uint256 initialUnits) {
        owner = msg.sender;
        units = initialUnits;
        lastChange = block.timestamp;
        changePeriod = 8;
    }
    
    modifier isOwner() {
        require(msg.sender == owner, "you are not allowed");
        _;
    }
    modifier isAuthorized() {
        require(admins[msg.sender] == true || msg.sender == owner);
        _;
    }

    modifier isTimeOk(uint256 _changePeriod) {
        require(block.timestamp > lastChange + _changePeriod, "not enough time" );
        lastChange = block.timestamp;
        _;
    } 

    function setUnits(uint256 newUnits) external {
        require(msg.sender == owner, "you are not allowed");
        units = newUnits; // 28860 sin revert
    }

    function setUnits2(uint256 newUnits) external {
        units = newUnits; // sin revert 28817
        require(msg.sender == owner, "you are not allowed");
    }

    function setUnits3(uint256 newUnits) external {
        if(msg.sender == owner) {
            units = newUnits;
        }
    }

    function incrementUnits(uint256 increment) external payable  {
        require(msg.value == 0.5 ether * increment);
        units = units + increment;
    }
    function addAdmin(address newAdmin) external isOwner {
        admins[newAdmin] = true;
    }

    function removeAdmin(address _admin) external isOwner {
                admins[_admin] = false;
       }

}
