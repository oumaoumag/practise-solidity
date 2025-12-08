// Every reference type has an additional annotation, the data location, about where the data is stored.
// There are three options - storage, memory, and calldata.

// STORAGE Location.
// Data stored in this location is persisted on the Ethereum blockchain. 
// This location is used to store long-term state variables in contracts.

// The ERC20 contract is template for creating fungible tokens on the Ethereum blockchain, standarsizing the functions for transferring and managing tokens.
// It relies mainly on two things 'mappings, _balances and _allowances, stored in Ethereum's storage menory location, ensuring that the information remains on the blockchain even after contract execution.
// 1. _balances Mapping: This mapping stores the number of tokens owned by each address. When users send or receive tokens, the contract updates the _balances with the new balances.
` mapping(address account => uint256) private_balances;

// 2. _allowances Mapping: This mapping records the amount of tokens that an address has allowed another address to transfer on its behalf.
// When a user transfers tokens on behalf of another user, the contract reduces the allowance in the _allowanxe in the _allowances and updates the _balances.
`mapping(address account => mapping(address spender => uint256)) private_allowances;

// Both mappings use the storage memory location, which provides a permanent record of token ownership and transfer permissions on the Ethereum blockchain.

// To put a variable in storage, you need to define it as a state variable, outside of functions.
pragma soldity ^0.8.4;

contract StorageExample {
    string name = "hello"; //  this string state variable is in storage
    function update() public {
        name = "hello-";
    }
}

// In terms of gas cost, is it more expensive to store data in the storage location on the Ethereum blockchain?

// Memory in Solidity represents a temprary data storage area. Unlike storage, data stored in memory is not persistent and 
// is lost when a function call ends.
// In the ERC20 contract, the memory data location is used for temporary variables, such as function parameters and return variables.
// It's less expensive in terms of gas cost compared to storage,.

// Function Parameters
// For example, in ERC20, the name_ and symbole_ variables in the constructor are stored in memory.
// ` 
// constructor(string memory name_, string memory symbol_) {
//   _name = name_;
//   _symbol = symbol_;
// }

// In this use case, the constructtor receives the name_ and symbol_ which are stored in memory. Afterward, these values are passed to the _name and _symbol state varibales, 
// which are storage variables and persist on the blockchain.

// This pattern of passing function parameters in memory variables to storage variabkes is common in smart contracts, and memory prives an efficent way to temporarily hold 
// this values.

// Function Return
// When a function returns a reference type varible _name in storage, it makes a copy of _name, store that copy in memory, and return the copy.
// This avoids directly mdifying the storage variables and reduce gas costs.
pragma solidity ^0.8.4;

contract MemoryExample {
    string public name;
    uint public score;

    function operate() public {
        score = 10;
        name = "Jane";

        // tempName is a temporary variable stored in memory
        string memory tempName = "Joe";
        tempNmae = name;
    }
}

// Memory is less expensive in terms of gas costs compared to storage as it doesn't involve writing data to the blockchain.
// When to use Memory?
// If you're working with temporay variables, especially within function calles, memory is the best place to declare them.
// There' tow scenarios basically
// 1. If you dont need the variable after function termination.
// 2. The variable involves many operations and are frequently modified.


// CallData
// CallData is immutable (read-only), temporary location where function arguments are stored, and behaves mostly like memory.
// The ERC20FlashMint contract provides an implementation of the ERC3156 Flash loans extenson, as defined in ERC-3156.
// Flash loans are a novel concept in the blockchain world, allowing users to borrow tokens for short period of time without any collateral. Users are required to return the loaned 
// amount plus a fee within the same transaction, ensurin that the loan is always repaid.
// In the flashLoan function of the ERC20FlashMint contract, one of the parameters is bytes calldata data.
` 

function flashLoan(
    IERC3156FlashBorrower receiver,
    address token,
    uint256 value,
    bytes calldata data
) publix virtual return (bool) {...}
`
// Here, calldata is used because data is an external function parameter. flashLOan should not try to modify it.
contract CalldataExample {
    function signUp(string calldata name) public returns (string memory) {
        return name;
    }
}

// The benefits of using calldata include:
// - Gas Efficiency: Calldata is cheaper in terms if gas cost as it is read-only and does nit make permanent changes to 
// the blockchain.
// - Security: Calldata is immutable during a function call which ensure that function arguments can't be accidentally modified.
