

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24 ;
import "verifier.sol";
contract Verifiy{
    
    uint256 public merlke_root;
    address public _userID=address(uint160(bytes20("1"))); //default
    Verifier verifier;
    Verifier.Proof public  ProofStruct;


    event AttemptOfVerification(address UserID, bool Success);

    event SuccessfullVerification(address UserID);
    event FailVerification(address UserID);

    constructor() {
        verifier= new Verifier();
    }
    function SetProof(uint[2] calldata arrForG1Points1,
                    uint[2] calldata arrForG2Points2_1, uint[2] calldata arrForG2Points2_2,
                    uint[2] calldata arrForG1Points3
                        ) public 
    {

        ProofStruct= Verifier.Proof(Pairing.G1Point(arrForG1Points1[0], arrForG1Points1[1]),
                                    Pairing.G2Point(arrForG2Points2_1,  arrForG2Points2_2), 
                                     Pairing.G1Point(arrForG1Points3[0], arrForG1Points3[1]));
    }
    function SetUserID(address UserId)  public
    {
        _userID=UserId;
    }
    function SetMerkleRoot(uint root) private 
    {
        merlke_root=root;
    }

    function Verify(uint[4] calldata m_root)public returns (bool) 
    {
        bool result=verifier.verifyTx(ProofStruct, m_root);
        if (result)
            emit SuccessfullVerification(_userID);
        else 
            emit FailVerification(_userID);
        return result;
    }
}