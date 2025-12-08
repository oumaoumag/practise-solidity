// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
* @title Enhance Variables Contract 
* @dev A demonstration of various solidity variable types and best practices
*/
contract EnhancedVariables {
    // State Variables  - stored on the blockchain

    // Public variables (automatically generate getters)
    string public text = "Hello";
    uint256 public num = 123;
    address public owner;
    bool public initialized = false;

     // Private variables (obly accessible within this contract)
     uint256 private _creationTimestamp;
     uint16 private _version = 1;

     // Constants (more gas efficient)
     uint256 public constant MAX_VALUE = 10000;
     string public constant CONTRACT_NAME = "Enhanced Variables";

     // Immutable (set once in constructor, then immutable - more gas efficient than regular state variable)
     address public immutable deployer;

     // Events for logging and frnt-end notifiation
     event TextUpdated(string oldText, string newText, address triggeredBy);
     event NumberUpdated(uint256 oldNum, uint256 newNum, address triggeredBy);
     event ContractInitialized(uint256 timestamp, address initializer);
    
     // Modifiers for function restrictions
     modifier onlyOwner() {
        require(msg.sender == owner, "Only Owner can call this function");
        _;
     }

     modifier whenInitialized() {
        require(initialized == true, "Only owner can call this function");
        _;
     }

     // Constructor runs once during deployment
     constructor() {
        owner = msg.sender;
        deployer = msg.sender;
        _creationTimestamp = block.timestamp;
     }

     /**
     * @dev Initialize the contract with custom values
     * @param _text The new text value
     * @param _num The new number value
     */
     function initialize(string memory _text, uint256 _num) external {
        require(!initialized, "Contract already initialized");

        text = _text;
        num = _num;
        initialized = true;

        emit ContractInitialized(block.timestamp, msg.sender);
     }

    /**
    * @dev update the stored text value
    * @param _newText The new text store
    */
    function updateText(string memory _newText) public onlyOwner whenInitialized {
        string memory oldText = text;
        text = _newText;

        // Emit event for blockchain logging
        emit TextUpdated(oldText, _newText, msg.sender);
    }

    /**
    * @dev Update the stored number value
    * @param _newNum The new number to store
    */
    function updateNumber(uint256 _newNum) public onlyOwner whenInitialized {
        require(_newNum <= MAX_VALUE, "Value exceeds maximum allowed");

        uint256 oldNum = num;
        num = _newNum;

        // Emit event for blockchain logging
        emit NumberUpdated(oldNum, _newNum, msg.sender);
    }

    /**
    * @dev Demonstrate local variabbles and global variables
    * @return timestamp current block timestamp
    * @return blockNumber Current block number
    * @return caller Address of the function caller
    */
    function getBlockInfo() public view returns (uint256 timestamp, uint256 blockNumber, address caller, uint256 contractAge) {
        // Local variables  - not stored on the blockchain, temporary in memory
        uint256 localVar  = 456;
        bool isLocalVar = true;

        // Global variables
        timestamp = block.timestamp;
        blockNumber = block.number;
        caller = msg.sender;

        // Using the local variables in calculatios to avoid "unused variable" warnings
        if (isLocalVar) {
            contractAge = timestamp - _creationTimestamp + (localVar > 0 ? 0 : 1);
        } else {
            contractAge = timestamp - _creationTimestamp;
        }

        // Return values as specified in the function declaration
        return (timestamp, blockNumber, caller, contractAge);
    }

    /**
     * @dev Get contract metadata
     * return The version, age, and initialized status
     */
    function getContractMetadata() public view returns (uint16 version, uint256 age, bool isInitialized) {
        version = _version;
        age = block.timestamp - _creationTimestamp;
        isInitialized = initialized;
    }

    /**
     * @dev Transfer ownership of the contract
     * @param newOwner Address of the new owner
     */
     function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner cannot be the zero address");
        owner = newOwner;
     }
}