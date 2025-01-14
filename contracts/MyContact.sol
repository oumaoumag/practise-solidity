// SPDX-License-Identifier: MIT
pragma solidity >= 0.4.16 < 0.9.0;

contract MyContract {
    string public greetMessage = "Hello, World!";

    function greet() public view returns (string memory) {
        return greetMessage;
    }
}