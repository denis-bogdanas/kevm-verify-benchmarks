pragma solidity 0.5.0;

contract SimpleMultiSigK3_00 {

    function execute(uint8[2] memory sigV, bytes32[2] memory sigR, bytes32[2] memory sigS, bytes memory data)
        public returns(uint256) {

        bytes32 hash = 0x0;

        for (uint i = 0; i < 2; i++) {
            address recovered = ecrecover(hash, 0, 0, 0);
            require(recovered > address(0));
        }

        return 5;
    }
}

