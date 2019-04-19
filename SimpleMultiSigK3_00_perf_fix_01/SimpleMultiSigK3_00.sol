pragma solidity 0.5.0;

contract SimpleMultiSigK3_00 {

    function execute(uint8 sigV, bytes32 sigR, bytes32 sigS, bytes memory data)
        public returns(uint256) {

        bytes32 hash = 0x0;

        for (int i = 0; i < 1; i++) {
            address recovered = ecrecover(hash, sigV, sigR, sigS);
            require(recovered > address(0));
        }

        return 5;
    }
}

