// The 'Constructor' in 'Solidity' is a special function executed only once during the 
// deployement of a smart contract to initialize its state variables and perform setup tasks
// If you don't define a constructor, an empty constructor that does nothing will be created by Soldity when 
// deploying the contract.
// SPDX-License-Identifier: GPL-3.0;
pragma solidity >=0.7.0 < 0.9.0;
 

contract A {
    uint public a;

    constructor(uint a_) {
        a = a_;
    }
}

contract B {
    // an empty constructor
    constructor() {}
}

// What is the difference between a constructor and a function?
// Constructors don't have
// 1. name - you don't need a name because there is only constructor and it will be called automatically
// 2. Returns - there's not return because the constructor is for setting up

// Why do we need a constructor?
// There are two reasons.
// 1. Avoid extra setup steps. There's some information we want to  setup at the time of the contract deployment. We use a constructor to avoid an extra step after deployment.
// 2. Access control. For example, we want to issue our own tokens, and I want to define the contract of this piece of information? We set this up at the deployment time - who 
// deploys the contract, who is the owner.