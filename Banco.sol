//SMART CONTRACT BANCO
//video4 Banco. Pragma es la versión en la que va a pasar el compilador de Solidity. En
//este caso la 0.4.17 Todo lo que empieza por // son comentarios y el compilador no los
//tiene en cuenta. Se utilizan para comentar el programa //
//SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.4.17;

// definición del objeto Banco. Es el contrato inteligente
contract Banco{
address owner;  //owner es el dueño

//la siguiente funcion construye el objeto Banco. 
//payable significa que esa función puede retornar dinero
// owner tiene la cuenta del propietario msg.sender
function  Banco1() payable public{
    owner = msg.sender;  // de esta forma owner tiene la Pk de owner
}
//modifier no es una función al uso, por eso no lleva ()
// se requiere que exista owner
// podemos tener tantos modificadores como queramos
modifier onlyOwner{
    require(msg.sender == owner);
    _;   // este _; implica que si se cumple el require se va a seguir ejecutando todo 
}

//la siguiente función cambia la dirección pública del propietario pero ojo,
// solamente puede cambiar a un nuevo dueño, el propietario real por el  onlyOwner
// esto pasa por el modifier y si no es el propietario no se ejecutará
function newOwner(address _newOwner) public onlyOwner{
    owner = _newOwner; // el parámetro _newOwner no ha de ser igual a la función newOwner. Es una buena práctica
}

//retorno de la dirección del propietario, esto se hace para que nadie pueda
//quitarle la dirección porque estas funciones son públicas
function getOwner() view public returns(address){
    return owner;
}

//obtenemos el balance de la cuenta
//retorna el balance o saldo  de la cuenta del objeto que invoca address(this).balance
function getBalance() view public returns(uint256){
    return address(this).balance;
}

//incrementamos el balance con mas dinero ether o gas por ejemplo
//payable significa que acepta dinero
//el usuario envia amount y luego requerimos que msg.value == amount 
function incrementBalance(uint256 amount) payable public{
    require(msg.value == amount);
}

//withdraw es transferencia en inglés
// al llevar onlyOwner, y ese ya lleva el require, no se necesita hacer el require aquí dentro
function withdrawBalance() public onlyOwner {
     msg.sender.transfer(address(this).balance);
}
} // cierra el objeto Banco
