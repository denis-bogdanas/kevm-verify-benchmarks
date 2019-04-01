pragma solidity 0.4.24;

contract encode_keccak_00 {

    function get() public returns(bytes32) {
        return keccak256(abi.encode(5));
    }
}