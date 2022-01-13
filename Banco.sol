//SMART CONTRACT BANCO
//video4 Banco. Pragma es la versión en la que va a pasar el compilador de Solidity. En
//este caso la 0.4.17 Todo lo que empieza por // son comentarios y el compilador no los
//tiene en cuenta. Se utilizan para comentar el programa //
pragma solidity ^0.4.17;

// definición del objeto Banco. Es el contrato inteligente
contract Banco{
address owner;

//la siguiente funcion construye el objeto Banco
function Banco() payable public{
owner = msg.sender;
}
modifier onlyOwner{
require(msg.sender == owner);
_;
}

//la siguiente función cambia la dirección pública del propietario
function newOwner (address _newOwner) public onlyOwner{
owner = _newOwner;
}

//retorno de la dirección de un solo propietario, esto se hace para que nadie pueda
//quitarle la dirección porque estas funciones son públicas
function getOwner() view public returns(address){
return owner;
}

//obtenemos el balance de la cuenta
function getBalance() view public returns(uint256){
return address(this).balance;
}

//incrementamos el balance con mas dinero ether o gas por ejemplo
function incrementBalance(uint256 amount) payable public{
require(msg.value == amount);
}

//withdraw es transferencia en inglés
function withdrawBalance() public onlyOwner {
msg.sender.transfer(address(this).balance);
}
} // cierra el objeto Banco
