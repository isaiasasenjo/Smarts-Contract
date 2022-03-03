SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.4.0;

//primer contrato
contract mortal{
	address owner;
	// Inicializa el contrato con la variable owner
	function mortal(){
        owner = msg.sender;
        }
	// function to recover the funds on the contract
	function kill(){
        if((msg == owner) selfdestruct(owner));
    }
}

// segundo contrato
contract greeter is mortal {
	string greeting;
	
	function greeter (string _greeting) public {
		greeting = _greeting;
	}
	
	function greet()  returns (string){
		return greeting;
	}
}
