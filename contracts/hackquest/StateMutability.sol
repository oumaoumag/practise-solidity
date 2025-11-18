// A pure function in Solidity is a function that doesn't modify the contracts's states, access external 
// contracts, or read the state of the blockchain; it only perfoms computations on its input parameters and returns a computed result.
pragma solidity ^0.8.0;

contract Example {
    mapping(int => int) aa;
    int c = 10;

    // this is a pure function
    function add(int a, int b) public pure returns(int) {
        return a + b;
    }

    // this is a not
    function addNotPure(int a, int b) public returns(int) {
        aa[0] = a + b;
        return aa[0];
    }

    // This is a view function, but it's not a pure function
    function addView(int a) public view returns(int) {
        // c is outside the function, and this is using information outside this functions
        // so not pure, but we're not modifying the information, so it's view 
        return a + c;
    }

    // This is neither pure not view
    function addNotPureNorView(int a, int b) public returns(int) {
        // c is outside the function and we're modifying the information
        c = a + b;
        return c;
    }
}

// A view function reads state variable but doesn't write to them
// View functions don't modify (write) the variables outside the function, but may use
// the information outside, while pure functions don't functions dont even read the data outside the functions

