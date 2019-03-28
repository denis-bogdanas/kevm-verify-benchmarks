pragma solidity 0.4.24;

contract keccakencode03 {

    function get(bytes32 x) public returns(bytes32) {
        return keccak256(abi.encodePacked(byte(0x19), x));
    }
}

