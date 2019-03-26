pragma solidity 0.4.24;

contract encode01 {

    function get() public returns(bytes) {
        return abi.encodePacked(byte(0x19));
    }
}