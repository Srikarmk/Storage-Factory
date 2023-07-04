//SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

contract SimpleStorage{
    //Basic datatypes - bool , uint , int , bytes , address
    //public makes the var visible externally and internally throught the blockchain
    uint256 public myFavoriteNumber;  // uint can have a limit from 8-256 (def being 256).

    struct Person {     // Structure can be used to create your own types and contain multiple values
        uint256 favoriteNumber;
        string name;
    }
    
    Person[] public listOfPeople; // Array of Structs

    mapping(string => uint256) public nameToFavoriteNumber; // mapping to find the favNum by using the name


    function store(uint256 _favoriteNumber) public virtual {  // public indicates that the function/ var is visible to everyone on the blockchain
        myFavoriteNumber=_favoriteNumber;   // _ is a notation to indicate a different between the state and local variable.
    }

    //view and pure are keywords/notations that don't cost gas on their own but will cost gas if called by a state changing function.
    function retrieve() public view returns(uint256){   //returns indicates what value type will be return by the specific function.
        return myFavoriteNumber;
    }

    // memory is used to depict the temporary storage of special types with allowed modifications 
    function addPerson(string memory _name , uint256 _favoriteNumber) public{
            listOfPeople.push(Person(_favoriteNumber,_name)); // Array push method to insert favNum and Name of struct at an index
            nameToFavoriteNumber[_name]=_favoriteNumber;  //mapping done using the _name as a key and _favoriteNumber as a value
    }
}