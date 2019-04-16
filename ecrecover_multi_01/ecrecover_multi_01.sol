pragma solidity 0.4.24;

contract ecrecover_multi_01 {

    function get(bytes32 hash, uint8[3] sigV, bytes32[3] sigR, bytes32[3] sigS) public returns(uint256) {

        address recovered = ecrecover(hash, sigV[0], sigR[0], sigS[0]);
        require(recovered > 0);

        return 5;
    }
}