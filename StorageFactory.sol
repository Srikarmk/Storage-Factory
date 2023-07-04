//SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";  //named imports - specifically imports a particular contract amidst multiple ones.

contract StorageFactory{

    SimpleStorage[] public listOfSimpleStorageContracts;  // creates a var of SimpleStorage Contract Type

    function createSimpleStorageContract() public{         // for creating multiple contracts
        SimpleStorage newSimpleStorage =new SimpleStorage();
        listOfSimpleStorageContracts.push(newSimpleStorage);
        
    }

    function sfStore(uint256 _simpleStorageIndex,uint256 _newSimpleStorageNumber) public{  //for storing values - setter
        //ABI - Application Binary Interface 
        SimpleStorage mySimpleStorage=listOfSimpleStorageContracts[_simpleStorageIndex];
        mySimpleStorage.store((_newSimpleStorageNumber));
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns(uint256){  // for retrieving values - getter
        SimpleStorage mySimpleStorage=listOfSimpleStorageContracts[_simpleStorageIndex];
        return mySimpleStorage.retrieve();
    }
}