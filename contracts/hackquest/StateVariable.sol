// StateVariable
// In solidity, it is percistent data storage location within a smart-contract that maintains its value across
// multiple function calls and transactions.
// In the ERC20, _totalSupply is a state variable that stores the total supply of the token.
// ' uint256 private _totalSupply; '

pragma solidity >= 0.4.0 < 0.9.0;

contract ContractName {
    // This is a state variable
    int a;

    function add(int b) public returns(int) {
        // b is defined as a parameter, so it's not a state variable
        // c is defined inside in a function, so it's  also not a state variable
        int c = a + b;
        return c;
    }
}

// To define a state variable, we need to put it outside of functions.
// When to use State Variabes?
// If this piece of information should be part of the blockchchain, then it should be state variables.
// State Variables are expensive,, somake sure that you ony set tem to be state variables when its worth the money. 

// What is the difference between a state variable in Solidity and a global variable in other programming languages?

// A state variable in Soliddity is a data storage location on the blockchain that persists across transactions, while
// a global variables in other programming languages is a data storage location within the program's runtime environment that typically does not persist
// beyond the program's execution.

pragma solidity >= 0.4.0 < 0.9.0;

contract Book {
    int256 bookID;
    bool read;

    // ...
    function a() public returns(int256) {
        // using state variable, assign value to the container
        bookID = 3;
        // int is a value type, so bookID will also have a value:3
        int256 bookId = bookID;
        return bookId;
    }
}