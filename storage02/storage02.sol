pragma solidity 0.4.24;

contract storage02 {
    uint public nonce;

    function inc() external returns (uint) {
        nonce = nonce + 1;
        return 5;
    }
}