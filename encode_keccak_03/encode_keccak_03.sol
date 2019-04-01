pragma solidity 0.4.24;

contract encode_keccak_03 {
    uint public nonce;

    function get() public returns(bytes32) {
        return keccak256(abi.encode(nonce));
    }
}