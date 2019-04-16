pragma solidity 0.4.24;

contract encode_packed_keccak_07 {

    function execute(bytes data, uint gasLimit) external returns(bytes32) {

        bytes32 txInputHash = keccak256(abi.encode(keccak256(data), gasLimit));

        bytes32 txTotalHash = keccak256(
                abi.encodePacked(byte(25), byte(1), txInputHash));

        return txTotalHash;
    }
}