// A mapping in solidity is a key-value data structure that allows
// efficient storage and retrival of data, where each key corresponds to a unique value.
// In an ERC20 contract, the `balances` mapping is used to store the token balances of various address.
// the key (addresses) are associated with their respective token balances (uint).

//  It provides one way association between two type - address and uint here
// ` mapping(address => uint) balances;
// Here the address is called the `key' type and 'uint' is the 'value' type.
// Todefine a mapping, we use keyword 'mapping' followed y the two types that
// we want to build a one-way association between. Finaly the name at the end.
// mapping(uint => uint) IDToID;

// SPDX-Identifier-License:M MIT
pragma solidity ^0.8.4;

contract bokk {
    // mapping(keyType => valueType) scope mappingName;
    mapping(address => uint) private owned_book;

    function add_book(uint bookID) public {
        // this will find the book given the owner
        owned_book[address(0x123)] = bookID
    }
 }
