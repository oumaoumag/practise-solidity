// SPDX-License-Identifier:MIT
pragma solidity >= 0.4.16 <0.9.0;

contract SimpleStorage {
    uint storedValue;

    function store(uint x) public {
    storedValue = x;
    }
    
    function get() public view returns (uint) {
        return storedValue;
    }
}

