// Struct -Define
// In solidity they Structs let you define custom data types by grouping multiple variables of diffrent types.
// The ERC20VotesLegacyMock contract is am extension of the ERC20 standard that adds functionality for token based 
// voting. This contract uses the checkpoint struct to track the voting power of the token holders over time.

// The Checkpoint struct is defined with two fields, -fromBlock and votes, that repectively record the block number and voting
// power at the time of a specific change in a holder's balance.
pragma solidity ^0.8.0;

contract Example {
     struct Checkpoint {
        uint32 fromBlock;
        uint224 votes;
     }

     struct Studdent {
        string Name;
        uint256 studentId;
        uint256 grade;
     }


// Whener a user's voting power changes, a new Checkpoint is created. This provides a historical record of
// voting power, essential for governance systems that rely on token-based voting.

struct Cat {
    string name;
    address owner;
    uint256 age;
}

// To define a struct, use the struct keyword followed by the name of the struct.

// Why use Structs?
// Struct decalrations are similar to class declararions in Java. They provide an easy way to organize and manage
// related data, making your code clearer and comprehensible.

// To Initialize a struct, we create an instance of the struct and set the values for its properties.
// The 'Checkpoint' struct records the block number (fromBlock) and the number of votes (votes) at that block. This allows the
// contract to track voting history.

// In the '_writeCheckpoint' function, the 'Checkpoint' struct is initialized and populated.
function _writeCheckpoint (
    Checkpoint[] storage ckpts, 
    function(uint256, uint256) view returns (uint256) op,
    uint256 delta 
    ) private returns (uint256 oldWeight, uint256 newWeight) {
        uint256 pos = ckpts.length;
        oldWeight = oldCkpt.votes;
        newWeight = op(oldWeight, delt);
        Checkpoint memory oldCkpt = pos == 0 ? Checkpoint(0, 0) : _unsafeAccess(ckpts, pos - 1);

        if (pos > 0 && oldCkpt.fromBlock == block.number) {
            // .......
        } else {
            ckpts.push(
                Checkpoint({fromBlock: SafeCast.toUint32(block.number), votes: SafeCast.toUint224(newWeight)})
            );
        }
  }

// In this function, a new checkpoint is initialized and populated based on the previous checkpoint and the change in votes (delta).
// If the last checkpoint was recorded in the current block, the votes in that checkpoint are updated.  
// Otherwise, a new Checkpoint struct is initializd with the current block number and new weight of votes and added to the checkpoints array.
// This continued use of strcut initialization in the ERC20VotesLegacyMock contract demonstrates how structs can be employed to efficiently storea and
// manage complex in Solidity Solidity smart contracts. In this case, it provides a robust method to track the voting
// history of each aacount, allowing for greater transparemcy and traceability in the voting process.
 struct StructName {
    string property1;
    uint property2;
 }

}
 // StructNmae instance  = StructName(value1, value2);

// To initialize a struct, we should use the struct name folowed by values for its properties in parentheses.

// Struct is a reference type, which means for each each instance we initialized, we need to store it either in
// Storage, Memeory, or Calldata.

contract StructExample {
    struct Student {
     string name;
     uint studentId;
    }

    Student public a = Student("Jane", 100);
    Student public b = Student("Luca", 200);
}