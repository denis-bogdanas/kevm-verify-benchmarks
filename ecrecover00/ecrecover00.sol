pragma solidity 0.4.24;

contract ecrecover00 {

    function get(bytes32 hash, uint8 sigV, bytes32 sigR, bytes32 sigS) public returns(address) {
        return ecrecover(hash, sigV, sigR, sigS);
    }
}