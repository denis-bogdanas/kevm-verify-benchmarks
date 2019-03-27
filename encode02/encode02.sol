pragma solidity 0.4.24;

contract encode02 {
    bytes32 public storage0;

    function get(bytes32 arg0) public returns(bytes) {
        return abi.encodePacked("\x19\x01", storage0, arg0);
    }
}