// Variables can be divided into two Categories
// 1. Value Type - Variables that store actual data such as int, bool, and addresses.
// 2. Reference Types - Variables that store a reference to the data's location, like mapping.

// SPDX-License-Identifier: mit
pragma solidity ^0.8,0;

contract Example {
    mapping(int256 => address) ap;

    function types() public {
        uint256 a = 1;
        uint256 b = a;
        a = 2; // a is updated, but stays the same
        b = 4; // b is updated, but a stays the same

        map[1] = address(0x123)
    }
}

// What happens when you assign a reference type value to another variable?
// Reference type are more complex data types that hold a refrence to the location of the data, rather
// than the data itself. They  incluse data structures like arrays, structs, and mapping. 
// When you assign reference type to another variable, both variables refer to the same data, and changes to
// one variable will affect the other.