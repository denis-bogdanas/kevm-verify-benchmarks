pragma solidity 0.5.0;

//get-failure-1 does not terminate
contract ecrecover_multi_02_ex_dest_exec_value {

    uint constant THRESHOLD = 3;

    function get(uint8[3] memory sigV, bytes32[3] memory sigR, bytes32[3] memory sigS,
            bytes memory data, uint gasLimit, bytes32 hash) public returns(uint256) {

        for (uint i = 0; i < THRESHOLD; i++) {
            address recovered = ecrecover(hash, sigV[i], sigR[i], sigS[i]);
            require(recovered > address(0));
        }

        return 5;
    }
}