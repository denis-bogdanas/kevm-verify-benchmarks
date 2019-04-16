pragma solidity 0.4.24;

contract encode_packed_keccak_07 {

    bytes32 constant TXTYPE_HASH = 0x3ee892349ae4bbe61dce18f95115b5dc02daf49204cc602458cd4c1f540d56d7;
    bytes32 constant SALT = 0x251543af6a222378665a76fe38dbceae4871a070b7fdaf5c6c30cf758dc33cc0;
    uint public nonce;                 // (only) mutable state
    bytes32 DOMAIN_SEPARATOR;          // hash for EIP712, computed from contract address

    function execute(uint8 sigV, bytes32 sigR, bytes32 sigS, address destination, uint value, bytes data, address executor, uint gasLimit) external returns(bytes32) {

        bytes32 txInputHash = keccak256(abi.encode(TXTYPE_HASH, destination, value, keccak256(data), nonce, executor, gasLimit));
        bytes32 totalHash = keccak256(abi.encodePacked(byte(25), byte(1), DOMAIN_SEPARATOR, txInputHash));

        return totalHash;
    }

    function () payable external {}
}