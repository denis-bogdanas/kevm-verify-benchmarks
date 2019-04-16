pragma solidity 0.5.0;

contract encode_packed_keccak_07 {

    function execute(bytes calldata data, uint gasLimit) external returns(bytes32) {
        bytes32 txInputHash = keccak256(abi.encode(keccak256(data), gasLimit));
        return keccak256(abi.encodePacked(byte(0x19), byte(0x01), txInputHash));
    }
}