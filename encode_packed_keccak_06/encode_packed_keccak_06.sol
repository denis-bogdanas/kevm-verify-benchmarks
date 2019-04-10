pragma solidity 0.4.24;

contract encode_packed_keccak_06 {

    function get(uint256 arg0) public returns(bytes32) {
        return keccak256(abi.encodePacked(byte(25), byte(1), arg0));
    }
}