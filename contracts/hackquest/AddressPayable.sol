pragma solidity ^0.8.0;

contract AddressArray {
    address payable add = payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    address b = add;
    uint balanace = b.balance;
    // We will make the function payable so we could send Ether
    // to this function and this function call transfer to send Ether
    // to the adddress
    function trans() public payable {
        // this transfers 10 Wei to address b from the current contract 
        add.transfer(10);
    }
 }
