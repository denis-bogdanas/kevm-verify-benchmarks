pragma solidity 0.5.0;

contract ecrecover_multi_02_F {

    uint constant THRESHOLD = 3;

    function get(uint8[3] memory sigV, bytes32[3] memory sigR, bytes32[3] memory sigS,
            address destination, uint value, bytes memory data, address executor, uint gasLimit, bytes32 hash) public returns(uint256) {

        for (uint i = 0; i < THRESHOLD; i++) {
            address recovered = ecrecover(hash, sigV[i], sigR[i], sigS[i]);
            require(recovered > address(0));
        }

        return 5;
    }
}