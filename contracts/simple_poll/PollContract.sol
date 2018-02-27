pragma solidity 0.4.20;

import "../utility_contracts/Ownable.sol";
import "../utility_contracts/BytesToString.sol";

contract Poll is Ownable, Bytes32ToString {
    struct Proposal {
        bytes32 name;   // short name (up to 32 bytes)
        uint voteCount; // number of accumulated votes
    }

    Proposal[] public proposals;

    // Poll constructor
    function Poll(bytes32[] proposalNames) public {

     for (uint i = 0; i < proposalNames.length; i++) {
            proposals.push(Proposal({
                name: proposalNames[i],
                voteCount: 0
            }));
        }

    }

    function ProposalName(uint index) public view returns (string) {
        return bytes32ToStr(proposals[index].name);
    }

    function Votes(uint256 index) public view returns (uint) {
        return proposals[index].voteCount;
    }

    function AddVote(uint index) public onlyOwner {
        proposals[index].voteCount++;  //Use safemath
    }

}
