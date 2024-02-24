// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;


contract Voting {

    address[] voters;

    uint public totalVotes;

    uint public cdCount;

    string public electionName;


    address public owner;


//Keep candidate's records
    struct Candidate {
        uint ID;
        string Name;        
        uint voteCount;       
    }

//An array of addresses
    Candidate[] public Candidates;


//mappings 
    mapping(uint256 => Candidate) candidates;
    mapping (address =>bool) hasVoted;

//sets the poll name and the msg.sender as owner
    constructor(string  memory _pollName) {
        electionName = _pollName;    
        owner = msg.sender;   
    }

//Checks for only owner
    modifier OnlyOwner()  {
        require(msg.sender == owner, "you are not owner");
        _;
    }

//allows the owner to add candidates
    function addCandidates(string memory _name ) external OnlyOwner{
        uint _cdID = cdCount + 1;        

        Candidate storage cns = candidates[_cdID];

        cns.ID = _cdID;
        cns.Name = _name;
        cns.voteCount = 0;
        
        Candidates.push(cns);

//candidates gets pushed to the array
        cdCount = cdCount + 1;

       
    }

//allows users to vote only once
   function Vote(uint _candidateID) public  {
        require(!hasVoted[msg.sender], "user already voted!");

        Candidate storage cns = Candidates[_candidateID];        
        cns.voteCount += 1;

        hasVoted[msg.sender] = true;
        totalVotes += 1;        
    }
}