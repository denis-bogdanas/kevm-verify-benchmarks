pragma solidity 0.4.24;

contract encode_packed_keccak_03 {
    bytes32 public storage0;

    function get(bytes32 arg0) public returns(bytes32) {
        return keccak256(abi.encodePacked(byte(25), byte(1), storage0, arg0));
    }
}