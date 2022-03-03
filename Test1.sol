// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;
//STRUCTURA SMART CONTRACT
// DECLARACIO DE VARIABLES DE STORAGE
// FUNCIONS 
// tipus de funcions
// external --> nomes cridada a partir de una transació ( hi ha una expeció, this.function )
// public --> crida apartir de transació o crida apartir del mateix contract (internal)
// view --> llegeix del storage pero no el modifica
// pure --> no llegueix res del storage ( ni modifica)
contract Test1{
    uint256 public variable; //STORAGE // public crea un getter per poder veure el seu valor.
    uint256[] public array; //STORAGE 
    function setVariable(uint256 _value) external {
        variable = _value;
    }
    // calldata --> es inmutable i nomes la podem lleguir.
    // arriba a partir dels arguments de la transació.
    // memory --> la podem modificar.
    function setArray(uint256[] calldata _array ) external {
        array = _array; // COPIEM el contigut de _array a l'array de storage.
    }
    function copyArrayDeStorageAMemory() external  view {
        uint256[] memory arrayMemory; // Es un punter que apuntara aun array de tipus uint256 dinamica i que estara en memory.
        arrayMemory = new uint256[](3); // [0,0,0] perque solidity inicialitza tot a 0.
        arrayMemory[1] = 3; // [0,3,0] 
        
        uint256[] memory arrayCopyMemory; // Es un punter que apuntara aun array de tipus uint256 dinamica i que estara en memory.
        arrayCopyMemory = arrayMemory; // ELS DOS APUNTANT A LA MATEIXA ARRAY DE MEMORIA. NO HI HA CAP COPIA.
        arrayCopyMemory = array; // COPIA TOTA array a arrayCopyMemory, perque hem trencat la barrera de STORAGE-MEMORY.
        uint256[] storage array2; // UN punter que qapuntara a una array de tipus uint256 dinamica i que estara en storage.
        array2 = array; // array2 apunta al mateix que array;
    }
}
