// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

/**
 * @title Enhanced Constants Contract
 * @dev Demonstrates various types of constants in Solidity and their use cases
 */
contract EnhancedConstants {
    // Simple constant values
    // Coding convention: UPPER_SNAKE_CASE for constants
    address public constant MY_ADDRESS = 0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint256 public constant MY_UINT = 123;
    
    // Constants with different data types
    string public constant PROJECT_NAME = "Enhanced Constants";
    bytes32 public constant PROJECT_ID = keccak256(abi.encodePacked(PROJECT_NAME));
    bool public constant IS_MAINNET = true;
    
    // Constants for business logic and limits
    uint256 public constant MAX_USERS = 1000;
    uint256 public constant MIN_DEPOSIT = 0.01 ether;
    uint256 public constant MAX_DEPOSIT = 10 ether;
    uint8 public constant COMMISSION_RATE = 5; // 5%
    
    // Time-related constants
    uint256 public constant ONE_MINUTE = 60;
    uint256 public constant ONE_HOUR = 60 * ONE_MINUTE;
    uint256 public constant ONE_DAY = 24 * ONE_HOUR;
    uint256 public constant ONE_WEEK = 7 * ONE_DAY;
    uint256 public constant ONE_YEAR = 365 * ONE_DAY;
    
    // Array of fixed values
    bytes4 public constant ERC20_INTERFACE_ID = 0x36372b07;
    bytes4 public constant ERC721_INTERFACE_ID = 0x80ac58cd;
    bytes4 public constant ERC1155_INTERFACE_ID = 0xd9b67a26;
    
    // Common error messages as constants
    string public constant ERROR_UNAUTHORIZED = "Caller is not authorized";
    string public constant ERROR_INVALID_AMOUNT = "Invalid amount specified";
    string public constant ERROR_DEADLINE_EXPIRED = "Operation deadline expired";
    
    // Contract state (not constant)
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    /**
     * @dev Example function showing how constants improve gas efficiency
     * @param amount The deposit amount to validate
     * @return isValid Whether the amount is valid based on our constants
     */
    function validateDeposit(uint256 amount) public pure returns (bool isValid) {
        // Using constants in conditionals is gas-efficient
        if (amount < MIN_DEPOSIT || amount > MAX_DEPOSIT) {
            return false;
        }
        return true;
    }
    
    /**
     * @dev Calculate commission using constant rate
     * @param amount The base amount
     * @return The commission amount
     */
    function calculateCommission(uint256 amount) public pure returns (uint256) {
        // Using constants in calculations
        return (amount * COMMISSION_RATE) / 100;
    }
    
    /**
     * @dev Check if an interface is supported
     * @param interfaceId The interface identifier
     * @return True if the interface is supported
     */
    function supportsInterface(bytes4 interfaceId) public pure returns (bool) {
        // Using constants in comparisons
        return (
            interfaceId == ERC20_INTERFACE_ID ||
            interfaceId == ERC721_INTERFACE_ID ||
            interfaceId == ERC1155_INTERFACE_ID
        );
    }
    
    /**
     * @dev Calculate deadline for an operation
     * @param durationInDays Number of days until deadline
     * @return The timestamp when the deadline expires
     */
    function calculateDeadline(uint256 durationInDays) public view returns (uint256) {
        // Using constants in time calculations
        return block.timestamp + (durationInDays * ONE_DAY);
    }
    
    /**
     * @dev Only owner can call this function
     */
    function adminFunction() public view {
        // Using constant error messages improves readability
        require(msg.sender == owner, ERROR_UNAUTHORIZED);
        
        // Function logic would go here
    }
}