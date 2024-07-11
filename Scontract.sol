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
    function SetProof(uint[2][2] calldata arrForG1Points, uint[2][2] calldata arrForG2Point) public 
    {

        ProofStruct= Verifier.Proof(Pairing.G1Point(arrForG1Points[0][0], arrForG1Points[0][1]),
                                    Pairing.G2Point(arrForG2Point[0],  arrForG2Point[1]), 
                                     Pairing.G1Point(arrForG1Points[1][0], arrForG1Points[1][1]));
    }
    function Verify(uint256[4] calldata m_root)public view returns (bool) 
    {
        return verifier.verifyTx(ProofStruct, m_root);
    }
}