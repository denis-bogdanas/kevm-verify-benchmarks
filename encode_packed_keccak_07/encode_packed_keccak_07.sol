pragma solidity 0.4.24;

contract encode_packed_keccak_07 {

    bytes32 DOMAIN_SEPARATOR = 0xdeadbeef;

    function execute(uint gasLimit) external returns(bytes32) {

        bytes32 txInputHash = keccak256(abi.encode(gasLimit));

        bytes32 txTotalHash = keccak256(
                abi.encodePacked(byte(25), byte(1), gasLimit));

        return txTotalHash;
    }
}