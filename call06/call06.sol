pragma solidity 0.5.0;

contract call06 {

    function execute(bool condition, address destination) public returns(bool) {
        bool success = false;
        assembly { success := call(gas, destination, 0, 0, 0, 0, 0) }
        return success;
    }
}