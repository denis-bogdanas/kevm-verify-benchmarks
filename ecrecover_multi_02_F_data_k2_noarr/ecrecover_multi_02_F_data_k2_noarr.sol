pragma solidity 0.5.0;

//get-failure-1 does not terminate
contract ecrecover_multi_02_F_data_k2_noarr {

    uint constant THRESHOLD = 2;

    function get(uint8 sigV0, uint8 sigV1, bytes32 sigR0, bytes32 sigR1, bytes32 sigS0, bytes32 sigS1, bytes memory data, bytes32 hash) public returns(uint256) {

        for (uint i = 0; i < THRESHOLD; i++) {
            address recovered;
            if (i == 0) {
                recovered = ecrecover(hash, sigV0, sigR0, sigS0);
            } else {
                recovered = ecrecover(hash, sigV1, sigR1, sigS1);
            }
            require(recovered > address(0));
        }

        return 5;
    }
}