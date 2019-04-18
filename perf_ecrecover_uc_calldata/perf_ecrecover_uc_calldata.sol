pragma solidity 0.5.0;

contract perf_ecrecover_uc_calldata {

    function get(bytes32 hash, uint8 sigV, bytes32 sigR, bytes32 sigS) public {
        address last = address(0);
        for (uint i = 0; i < 3; i++) {
            address recovered = ecrecover(hash, sigV, sigR, sigS);
            require(recovered > last);
        }
    }
}

