//SMART CONTRACT 1.- SimpleStorage
// SPDX-License-Identifier: MIT
// Es el primer CI del pdf
// SPDX-License-Identifier: MIT
// Es el primer CI del pdf
pragma solidity ^0.6.0;

contract SimpleStorage {
    uint256 storedValue; // we are storing 256 bits on blockchain

    //Las funciones de visualización (view) garantizan que no modificarán el estado. 
    //Una función se puede declarar como vista. Las siguientes declaraciones, 
    //si están presentes en la función, se consideran que modifican el estado y el compilador 
    //arrojará una advertencia en tales casos.
    // Las funciones de visualización no requieren una transacción, solo una llamada.
    //Las funciones de visualización pueden regresar inmediatamente (las transacciones deben ordenarse por
consenso).
    function getStoredValue() public view returns (uint256) {
        return storedValue;
    }

    function setStoredValue(uint256 newValue) public {
        storedValue = newValue;
    }
} //fin del CI SimpleStorage
