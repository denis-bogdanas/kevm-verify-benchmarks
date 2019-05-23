pragma solidity 0.5.0;

//get-failure-1 does not terminate
contract ecrecover_multi_02_H_calllog {

    uint constant THRESHOLD = 2;

    function get(bool condition, uint gasLimit, uint value, bytes memory data, address destination, bytes32 hash) public {

        for (uint i = 0; i < THRESHOLD; i++) {
            address recovered = ecrecover(hash, uint8(i), bytes32(i), bytes32(i));
            require(recovered > address(0));
        }

        bool success = false;
        assembly { success := call(gasLimit, destination, value, add(data, 0x20), mload(data), 0, 0) }
        require(success);
    }
}