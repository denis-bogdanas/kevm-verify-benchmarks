pragma solidity 0.4.24;

contract ecrecover_multi_03 {

    uint constant THRESHOLD = 3;

    function get(bytes32 hash, uint8[3] sigV, bytes32[3] sigR, bytes32[3] sigS) public returns(uint256) {

        address lastAdd = address(0);
        for (uint i = 0; i < THRESHOLD; i++) {
            address recovered = ecrecover(hash, sigV[i], sigR[i], sigS[i]);
            require(recovered > lastAdd);
            lastAdd = recovered;
        }

        return 5;
    }
}