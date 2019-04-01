pragma solidity 0.4.24;

contract encode_packed_keccak_00 {

    function get(bytes32 x) public returns(bytes32) {
        return keccak256(abi.encodePacked(x));
    }
}