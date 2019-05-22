pragma solidity 0.5.0;

contract call_log_00 {

    function execute(bool condition, uint gasLimit, uint value, bytes memory data, address destination) public returns(bool) {
        bool success = false;
        assembly { success := call(gasLimit, destination, value, add(data, 0x20), mload(data), 0, 0) }
        return success;
    }
}