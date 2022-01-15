//SMART CONTRACT Fabrication  es la primera versión
//UNA VERSIÓN DE FABRICATION.SOL
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Fabrication0 {

uint256 public units;
address public owner;
//el constructor solo se ejecuta una vez cuando se crea o despliega el contrato

constructor(uint256 initialUnits){  
    owner = msg.sender;
    units = initialUnits;
}

function setUnits(uint256 newUnits) public {
    units = newUnits;
    require(msg.sender == owner,"you are not");
    //acciones
    units = newUnits;
}
function incrementUnits(uint256 newInc) public {
    //units = newUnits;
    require(msg.sender == owner,"you are not");
    //acciones
    units = units + newInc;
}
}

//FIN DEL SMART CONTRACT Fabrication0
