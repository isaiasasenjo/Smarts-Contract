SPDX-License-Identifier: GPL-3.0
contract mortal{
	address owner;
	// Inicializa el contrato con la variable owner
	function mortal() {owner = msg.sender;}
	// functio to recover the funds on the contract
	function kill() {if(msg == owner) selfdestruct(owner);}
}

contract greeter is mortal {
	string greeting;
	
	function greeter (string _greeting) public {
		greeting = _greeting;
	}
	
	function greet() constant returns (string){
		return greeting;
	}
}
