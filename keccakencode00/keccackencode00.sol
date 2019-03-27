pragma solidity 0.4.24;

contract keccackencode00 {

    function get(uint x) public returns(bytes32) {
        return keccak256(abi.encodePacked(x));
    }
}