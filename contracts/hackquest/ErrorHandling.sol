// Require checks if a certain condition is satified in the code.
// If not, then it reports an error message and terminates the execution.
// The error message is optional.

// In the mint function in the UniswapV2Pair contract, the require statement checks if the variable liquidity is greater than zero. If liquidity is not 
// greater than zero, the function exececution willhalt, and an error messge 'UniswapV2: INSUFFIECIENT_LIQUIDITY_MINTED' will be provided as the reason for the reverte.

// The purpose of this require statement is to ensure that the minting operation is valid and meaningful. 
// In the context of a decentralized exxhange like Uniswap, the mint function is used to create liquidity tokens when users provide liquidity to a trading pair.
// The amount of liquidity tokens to be minted depends on the amount of tokens provide and the current reverses of the trading pair.

// ' require(recipient != address(0), "Recipient address cannot be zero");'
/// To check on the condition, we use the keyword 'require', then follow by the conndion, and message to report error if the condition is not satisfied.

pragma solidity ^0.8.4;

contract VendingMachine {
    address a = address(0x123);
    function buy(uint amount) public payable {
        require(
            // We will explain msg.sender in next lesson
            a == msg.sender,
            "Not  authorized."
        );
        // Execute the purchase.
    }

}