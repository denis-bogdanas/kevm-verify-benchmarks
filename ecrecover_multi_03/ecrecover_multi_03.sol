pragma solidity 0.5.0;

contract ecrecover_multi_03 {

    uint constant THRESHOLD = 3;

    function get(bytes32 hash, uint8[3] memory sigV, bytes32[3] memory sigR, bytes32[3] memory sigS) public returns(uint256) {

        address lastAdd = address(0);
        for (uint i = 0; i < THRESHOLD; i++) {
            address recovered = ecrecover(hash, sigV[i], sigR[i], sigS[i]);
            require(recovered > lastAdd);
            lastAdd = recovered;
        }

        return 5;
    }
}