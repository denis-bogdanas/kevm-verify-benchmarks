pragma solidity 0.4.24;

contract keccak00 {

    function getkeccakx(bytes x) pure external returns(bytes32) {
        return keccak256(x);
    }
}