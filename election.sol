pragma solidity 0.8.7;

contract Election {
    
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
        address cAdd;
    }


    uint public candidatesCount;

   
       
    mapping(address => bool) public voters;
    mapping(uint => Candidate) public candidates;

    function set(address _addr) public {
       
        voters[_addr] = false;
             
    }

    constructor() public
    {
        addCandidate("Candidate 1",0x9839E6311e253E6dFF0749FC699dA54528cb5b11);
        addCandidate("Candidate 2",0x5f8651fb769469a2aF112935A4d2b1DB70BD56b4);
        addCandidate("Candidate 3",0x0A3a94166a60cA404C60B06573Ca6660C34F2BC9);
        addCandidate("Candidate 4",0x0A9F87f5345504001324b61faCA5cDE6454eb648);
    }

     function addCandidate (string memory _name,address _add) public {
        candidatesCount++; 
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0,_add);
    }



    
    function vote (uint _candidateId,address _vAdd) public {
        

        
        require(_candidateId > 0 && _candidateId <= candidatesCount);
        voters[_vAdd] = true;
        candidates[_candidateId].voteCount ++;

      
    }
    uint public winner;
    uint public winnerVoteCount = 0 ;
    function deicideWinner() public returns(uint  ){
        
        for(uint i = 1;i<= candidatesCount; i++ )
        {
            if(candidates[i].voteCount > winnerVoteCount)
            {
                winnerVoteCount = candidates[i].voteCount ;
                winner = i;
            }
        }
        return winner;
    }

    function shoWinnerName() public view returns(string memory)
    {
        return candidates[winner].name;
    }

}

