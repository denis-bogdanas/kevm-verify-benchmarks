pragma solidity 0.5.0;

contract multisig14 {

    bytes32 constant EIP712DOMAINTYPE_HASH = 0xd87cd6ef79d4e2b95e15ce8abf732db51ec771f1ca2edccf22a46c729ac56472;
    bytes32 constant NAME_HASH = 0xb7a0bfa1b79f2443f4d73ebb9259cddbcd510b18be6fc4da7d1aa7b1786e73e6;
    bytes32 constant VERSION_HASH = 0xc89efdaa54c0f20c7adf612882df0950f5a951637e0307cdcb4c672f298b8bc6;
    bytes32 constant TXTYPE_HASH = 0x3ee892349ae4bbe61dce18f95115b5dc02daf49204cc602458cd4c1f540d56d7;
    bytes32 constant SALT = 0x251543af6a222378665a76fe38dbceae4871a070b7fdaf5c6c30cf758dc33cc0;
    uint256 constant THRESHOLD = 3;

    uint public nonce;
    mapping (address => bool) isOwner;
    address[] public ownersArr;
    bytes32 DOMAIN_SEPARATOR;

    function execute(uint8[3] memory sigV, bytes32[3] memory  sigR, bytes32[3] memory sigS, address destination, uint value, bytes memory data, address executor, uint gasLimit) public {
        require(executor == msg.sender || executor == address(0));

        bytes32 txInputHash = keccak256(abi.encode(TXTYPE_HASH, destination, value, keccak256(data), nonce, executor, gasLimit));
        bytes32 totalHash = keccak256(abi.encodePacked(byte(0x19), byte(0x01), DOMAIN_SEPARATOR, txInputHash));

        address lastAdd = address(0);
        for (uint i = 0; i < THRESHOLD; i++) {
            address recovered = ecrecover(totalHash, sigV[i], sigR[i], sigS[i]);
            require(recovered > lastAdd && isOwner[recovered]);
            lastAdd = recovered;
        }

        nonce = nonce + 1;

        bool success;
        assembly { success := call(gasLimit, destination, value, add(data, 0x20), mload(data), 0, 0) }
        require(success);
    }
}