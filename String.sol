// Strings
// A 'String' is use to represent textual data, like the name "GUA", date "Dec 18, 2000", or any tex.

// To declare a string we use the keyword 'string' then express the textual content using either single or double quotes.
// We use '=' to assign the new value to it.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LearningStrings {
    string car = "BMW";
    string text;

    // assign a value to a string variable using the function
    function setText () public returns (string memory) {
        text = "Hello World";
        return text;
    }

}

// 'String' is reference type in Solidity and is mutabke, meaning its length and content can be modified after initialization
