// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contador {
	uint256 count;

	function Contador(uint256 _count){
		count = _count;
	}


	function setCount(uint256 _count) public {
		count = _count;
	}

	function incrementCount() public {
		count = count+1;
	}

	function getCount() public view returns(uint256){
		count = _count;
	}

	function getNumber() public view returns(uint256) {
		return 200;
	}
}   // cierra el contrato Contador
