// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleToken  is Ownable {
    string public name = "SimpleToken";
    string public symbol = "STK";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    // address public owner;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed  spender,  uint256 value);
    event Mint(address indexed to, uint256 value);
    event Burn(address indexed from, uint256 value);

    // modifier onlyOwner() {
    //     require(msg.sender == owner, "Only the owner can perform");
    //     _;
    // }

    constructor() Ownable(msg.sender) {
       //  Constructor initializes the Ownable contract with the deployer's address
    }

    function mint(address to, uint256 amount) external onlyOwner {
        require(to != address(0), "Cannot mint to the zero address");
        totalSupply += amount;
        balanceOf[to] += amount;
        emit Mint(to, amount);
    }

    function transfer(address to, uint256 amount) external {
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        require(to != address(0), "Cannot transfer to the zero address");

        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        emit Transfer(msg.sender, to, amount);
    } 

        // Function to check the balance of any address
    function checkBalance(address account) external  view returns (uint256) {
        return balanceOf[account];
    }
}