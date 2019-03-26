pragma solidity 0.4.24;

contract keccak04 {
    uint public nonce;

    function getkeccak() public returns(bytes32) {
        return keccak256(abi.encodePacked(byte(0x19), byte(0x01), nonce));
    }
}