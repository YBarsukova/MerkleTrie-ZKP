import "verifier.sol";

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24 ;
interface VerifierInterface{

 // function verifyTx(Verifier.Proof memory proof, uint[4] memory input) public view returns (bool r);
}
contract Verifiy{
    uint256 public merlke_root;
    Verifier verifier;
    Verifier.Proof ProofStruct;
    function SetProof(string calldata s1, string calldata s2, string calldata s3) public 
    {
        //TODO proof creation
    }
    function Verify(uint256[4] calldata m_root)public view returns (bool) 
    {
        return verifier.verifyTx(ProofStruct, m_root);
    }
}