// Visibility or Scope says when we can access this variable or function.
// 'public' any variables and functions that are marked to be public could be accessed from anywhere, by 
// functions both in the contract and other contracts.

// SPDX-Identifier-License: MIT
pragma solidity ^0.8.4;
// If we put the code in Remix and deploy it
// we could see that could access the function aa
// and also the variable a, because they're public.
contract A {
    uint public a;
    function aa() public {
        // this is the same as a = a + 1;
        a++;
    }

    // In the ERC20 contract, the name function is marked as 'public'. 
    // It is readable directly from external contracts or interfaces without the nedd
    // for getter functions.
    function name() public view virtual returns (string memory) {
        // return _name;
    }
}
