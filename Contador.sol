//SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;
contract Contador {
	uint256 count;
	string letra; 
	function Contador1(uint256 _count) public{
		count = _count;
	}
	function setCount(uint256 _count) public {
		count = _count;
	}
	function incrementCount() public {
		count = count+1;
	}
	function getCount() public view returns(uint256){
		return count;
	}
	function getNumber() public pure returns(uint256) {
		return 200;
	}
}   // cierra el contrato Contador
