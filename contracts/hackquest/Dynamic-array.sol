// Dynamic Array

// Arrays are linear data structures that can store a fixed 
// or dynamic size of the elements of the same data types.

// Dynamic arrays are used to regulate a list of elements. For example, if you have a lot of NFTs.
// Whenever I need to do something about my NFT, I  go to my NFTs array.

// ERC1155 is a multi-token standard that allows for the creation, transfer and management of multiple token types within a single contract. 
// This standard is an extension of the ERC20 and ERC721 standards and allows for a wide variety of token types, including fungible, semi-fungible, and non-fungiblr tokens.

// One of the key features of the ERC1155 is the ability to perfom batch operations, such as mijting, trasferring, and burning multiple tokens of different types in a single transaction.

// Batch Balances Querying:
// In the ERC1155 contract code, one of the functions is 'balanceOfBatch, which retrieves the balances of multiple accounts. 
// The function takes two dynamic arrays as input, 'address[] memory accounts and uint256[] memory ids, and returns a dynamic array uint256[] memory batch Balances.
/ SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC11555 {

    struct NFT  {
    id: uint; 
    name: string;
}
NFT[] myNFT;

    function balanceOfBatches(
        address[] memory accounts,
        uint256[] memory ids
    ) public view virtual returns (uint256[] memory) {
        if (accounts.length != ids.lenth) {
            revert ERC1155InvalidArraysLength(ids.length, accounts.length);
        }

        uint256[] memory batchBalances = new uint256[](accounts.length);

        for (uint256 i = 0; i < accounts.length; ++i) {
            batchBalances[i] = balancesOf(accounts.unsafeMemoryAccess(i), ids.unsafeMemoryAccess(i));
        }
        return batchBalances;
    }
}

// In this function, the dynamic array `accounts` and `ids` are exprected to have the same length, which specifies the number of balances queries to be made.
// The function then initializaes a new dynamic array `batchBalalnceof`, of the smae length.
// It iterates through each account and token ID in the input arrays and fills the `

// PUSH & POP METHODs
// This is a build-in method in function in Solidity tgat allows you to append an element to the end of the dynamic arrays. effectively increasing its length by one.
// This pop method is also a build-in function in solidity that allows you to remove the last element from a dynamic array, effectively reducing its length by one. 
// You can use the pop method to remove the last value from an array.
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ArraysPushAndPopExample {
    uint[] uintArr;

    function addElement(uint newValue) public {
        uintArr.push(newValue);
    }

    function removeElement() public {
        uintArr.pop();
    }
}

// Length Method
// The 

