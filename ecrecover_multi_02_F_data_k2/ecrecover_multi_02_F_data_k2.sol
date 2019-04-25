pragma solidity 0.5.0;

//get-failure-1 does not terminate
contract ecrecover_multi_02_F_data_k2 {

    uint constant THRESHOLD = 2;

    function get(uint8[2] memory sigV, bytes32[2] memory sigR, bytes32[2] memory sigS, bytes memory data, bytes32 hash) public returns(uint256) {

        for (uint i = 0; i < THRESHOLD; i++) {
            address recovered = ecrecover(hash, sigV[i], sigR[i], sigS[i]);
            require(recovered > address(0));
        }

        return 5;
    }
}