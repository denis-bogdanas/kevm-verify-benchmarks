pragma solidity 0.4.24;

contract encode_packed_01 {

    function get(bytes32 arg0, bytes32 arg1) public returns(bytes) {
        return abi.encodePacked("\x19\x01", arg0, arg1);
    }
}