pragma solidity 0.4.24;

contract keccackencode01 {

    function get(bytes32 x) public returns(bytes32) {
        return keccak256(abi.encodePacked("\x19x01", x));
    }
}