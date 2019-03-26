pragma solidity 0.4.24;

contract keccak01 {
    uint public nonce;

    function getkeccakstorage() public returns(bytes32) {
        return keccak256(abi.encode(nonce));
    }
}