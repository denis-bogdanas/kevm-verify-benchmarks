pragma solidity 0.5.0;

contract SimpleMultiSigK3_00 {

    uint256 constant THRESHOLD = 3;

    function execute(uint8[3] memory sigV, bytes32[3] memory sigR, bytes32[3] memory sigS, bytes memory data)
        public returns(uint256) {

        for (uint i = 0; i < THRESHOLD; i++) {
            address recovered = ecrecover("0x19", sigV[i], sigR[i], sigS[i]);
            require(recovered > address(0));
        }

        return 5;
    }
}

