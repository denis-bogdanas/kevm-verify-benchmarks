pragma solidity 0.5.0;

contract ecrecover_multi_02_A {

    uint constant THRESHOLD = 3;

    function get(bytes32 hash, uint8[3] memory sigV, bytes32[3] memory sigR, bytes32[3] memory sigS) public returns(uint256) {

        for (uint i = 0; i < THRESHOLD; i++) {
            address recovered = ecrecover(hash, sigV[i], sigR[i], sigS[i]);
            require(recovered > address(0));
        }

        return 5;
    }
}