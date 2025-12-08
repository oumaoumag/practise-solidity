// Function call refers to the act of invoking a specific function within a `contract`
// triggering the execution of its code and potentially modifying the contract's state or returning a value

// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.19;

contract A {

    // Function to add two intergers 
    function add(int a, int b) public pure returns(int) {
        return a + b;
    }

    // Function to add three integers
    function addUp(int a, int b, int c) public pure returns(int) {
        int d = add(a, b);
        return add(d, c);
    }

    //  Function to add and multiply two integers
    function addMul(int a, int b) public pure returns(int, int) {
        return (a + b, a * b);
    }

    // Function to add and multiply three integers
    function addMulUp(int a, int b, int c) public pure returns(int, int) {
        (int d, int e) = addMul(a, b);
        return addMul(d, c + e);
    }
}