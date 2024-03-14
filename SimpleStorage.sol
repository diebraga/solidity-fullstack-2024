// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

contract SimpleStorage {
    uint256 favoriteNumber;

    struct People {
        // Defines a struct named People with two fields.
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    // mapping that allows to input name to returns favorite number

    function store(uint256 _favoriteNumber) public {
        // assign favorite number
        favoriteNumber = _favoriteNumber;
    }

    function retrieve() public view returns (uint256) {
        // Public view function to retrieve the stored favorite number.
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // Function to add a person (with name and favorite number) to the people array and mapping.
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
        // Updates the mapping with the new person's name and favorite number.
    }
}
