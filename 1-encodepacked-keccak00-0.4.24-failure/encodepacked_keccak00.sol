pragma solidity 0.4.24;
contract encodepacked_keccak00 {
    function execute(bytes32 a0) pure external returns(bytes32) {
        return keccak256(abi.encodePacked(byte(0x01), a0));
    }
}