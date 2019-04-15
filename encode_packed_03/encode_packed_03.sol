pragma solidity 0.4.24;

contract encode_packed_03 {

    function get(bytes32 arg0) public returns(bytes) {
        return abi.encodePacked(byte(25), byte(1), arg0);
    }
}