pragma solidity 0.5.0;

//get-failure-1 does not terminate
contract ecrecover_single_02_H_calllog_02 {

    function get(bool condition, uint gasLimit, uint value, bytes memory data, address destination, bytes32 hash) public {
        bool success = false;
        assembly { success := call(gasLimit, destination, value, add(data, 0x20), mload(data), 0, 0) }
        require(success);
    }
}

