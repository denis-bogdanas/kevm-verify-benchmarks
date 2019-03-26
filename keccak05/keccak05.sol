pragma solidity 0.4.24;

contract keccak05 {

    function getkeccak(uint x) public returns(bytes32) {
        return keccak256(abi.encodePacked(byte(0x19), x));
    }
}