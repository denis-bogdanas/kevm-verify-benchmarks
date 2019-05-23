pragma solidity 0.5.0;

//get-failure-1 does not terminate
contract ecrecover_multi_02_H_calllog {

    uint constant THRESHOLD = 2;

    function get(bytes memory data, bytes32 hash) public returns(uint256) {

        for (uint i = 0; i < THRESHOLD; i++) {
            address recovered = ecrecover(hash, uint8(i), bytes32(i), bytes32(i));
            require(recovered > address(0));
        }

        return 5;
    }
}