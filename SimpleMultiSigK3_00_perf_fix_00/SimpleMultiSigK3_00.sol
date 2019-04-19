pragma solidity 0.5.0;

contract SimpleMultiSigK3_00 {

    uint256 constant THRESHOLD = 3;
    mapping (address => bool) isOwner;

    function execute(   uint8[3] memory sigV, bytes32[3] memory sigR, bytes32[3] memory sigS,
                        address destination, uint value, address executor, uint gasLimit, bytes32 totalHash)
        public returns(uint256) {

        address lastAdd = address(0);
        for (uint i = 0; i < THRESHOLD; i++) {
            address recovered = ecrecover(totalHash, sigV[i], sigR[i], sigS[i]);
            require(recovered > lastAdd);
            lastAdd = recovered;
        }

        return 5;
    }
}
