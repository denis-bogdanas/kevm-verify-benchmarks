pragma solidity 0.5.0;

contract call05 {

    function execute(address destination, uint value, bytes memory data, uint gasLimit) public returns(bool) {
        bool success = false;
        assembly { success := call(gas, destination, 0, 0, 0, 0, 0) }
        return success;
    }
}