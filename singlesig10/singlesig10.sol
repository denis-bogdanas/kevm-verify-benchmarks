pragma solidity 0.4.24;

contract singlesig10 {

    // EIP712 Precomputed hashes:
    // keccak256("EIP712Domain(string name,string version,uint256 chainId,address verifyingContract,bytes32 salt)")
    bytes32 constant EIP712DOMAINTYPE_HASH = 0xd87cd6ef79d4e2b95e15ce8abf732db51ec771f1ca2edccf22a46c729ac56472;

    // kekkac256("Simple MultiSig")
    bytes32 constant NAME_HASH = 0xb7a0bfa1b79f2443f4d73ebb9259cddbcd510b18be6fc4da7d1aa7b1786e73e6;

    // kekkac256("1")
    bytes32 constant VERSION_HASH = 0xc89efdaa54c0f20c7adf612882df0950f5a951637e0307cdcb4c672f298b8bc6;

    // kekkac256("MultiSigTransaction(address destination,uint256 value,bytes data,uint256 nonce,address executor,uint256 gasLimit)")
    bytes32 constant TXTYPE_HASH = 0x3ee892349ae4bbe61dce18f95115b5dc02daf49204cc602458cd4c1f540d56d7;

    bytes32 constant SALT = 0x251543af6a222378665a76fe38dbceae4871a070b7fdaf5c6c30cf758dc33cc0;

    uint public nonce;                 // (only) mutable state
    mapping (address => bool) isOwner; // immutable state
    address[] public ownersArr;        // immutable state

    bytes32 DOMAIN_SEPARATOR;          // hash for EIP712, computed from contract address

    // Note that address recovered from signatures must be strictly increasing, in order to prevent duplicates
    function execute(uint8 sigV, bytes32 sigR, bytes32 sigS, address destination, uint value, bytes data, address executor, uint gasLimit) external returns(bytes32) {
        require(executor == msg.sender || executor == address(0));

        // EIP712 scheme: https://github.com/ethereum/EIPs/blob/master/EIPS/eip-712.md
        bytes32 txInputHash = keccak256(abi.encode(TXTYPE_HASH, destination, value, keccak256(data), nonce, executor, gasLimit));
        bytes32 totalHash = keccak256(abi.encodePacked(byte(25), byte(1), DOMAIN_SEPARATOR, txInputHash));

        return totalHash;
    }

    function () payable external {}
}