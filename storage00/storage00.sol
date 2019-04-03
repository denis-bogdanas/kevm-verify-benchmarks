pragma solidity 0.4.24;

contract storage00 {
    uint public nonce;

    function inc() external {
        nonce = nonce + 1;
    }
}