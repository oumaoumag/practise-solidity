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

// Mapping allows for Adding, Updating, Deleting, and Querying. 
// There is no fundamaental diffrence btwn adding and modifying: both involve
// the value associated with a key in storage.
pragma solidity ^0.8.4;

contract Book {
    // mapping(keyType -> valueType) scope MappingName;
    mapping(address => uint) private owned_book;

    function add_book(uint bookID) public {
        // this will find the book given the owner
        owned_book[address(0x123)] = bookID;
    }
}

// Querying a mapping refers to accessing the value associated with a specific key (usually an address or identifier) within 
// the mapping data structure to retrieve information or perfom actions based on that value.
// Example use scase:
// function balanceOf(address account) public view virtual returns (uint256) {
//    returns _balances[account];
//}

pragma solidity ^0.8.4;

contract book {
 // mapping(keyTYpe => valueType) scope mappingName;
 mapping(address => uint) private owned_book;

 function add-book(address owner, uint bookID) public {
    // this will find the book given the owner
    owned_book[owner] = bookID;
 }

 function get_book(address owner) public view returns(uint) {
    // this will find the book given the owner
    return owned_book[owner];
 }

}

// To access the value associated with the key, we use brackets.

// DELETING
// Refers to the removal of a key-value pair from a mapping, effectively erasing the association between a key and its corresponding value.
// Deleting is essentialy just resetting the value associated with the key to its default value.
// To delete a key-value pair, we use the keyword 'delete'
// Here deleting is actually the same as assigning the value to the default value. In Solidity, if you try to query an unsigned key, it will return the default value.
// Returning the default value is not a universal behavior, as in other programming languages, it could report an error.
pragma solidity ^0.8.4
contract A {
    mapping(address => uint) public balance;

    function add() public {
        balance[address(0x0000000000000000000000000000000000000123)] = 10;
    }

    function deleteF() public {
        delete balance[address(0x0000000000000000000000000000000000000123)];
    }

    function update() public {
        balance[address(0x123)] += 10;
    }
}