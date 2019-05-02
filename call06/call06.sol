pragma solidity 0.5.0;

contract call06 {

    function execute(bool condition, address destination, uint value, bytes memory data, uint gasLimit) public returns(bool) {
        require(condition);

        bool success = false;
        assembly { success := call(gasLimit, destination, value, add(data, 0x20), mload(data), 0, 0) }
        return success;
    }
}