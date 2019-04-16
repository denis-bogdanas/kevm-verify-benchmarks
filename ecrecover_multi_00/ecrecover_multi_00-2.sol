pragma solidity 0.4.24;

contract ecrecover_multi_00 {
    uint256 constant THRESHOLD = 3;

    function get(bytes32 hash, uint8[3] sigV, bytes32[3] sigR, bytes32[3] sigS) public returns(uint256) {

        for (uint i = 0; i < THRESHOLD; i++) {
            address recovered = ecrecover(hash, sigV[i], sigR[i], sigS[i]);
            require(recovered > 0);
        }

        return 5;
    }
}