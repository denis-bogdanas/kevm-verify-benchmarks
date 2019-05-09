pragma solidity 0.5.0;

contract call08 {

    function execute(bool condition, address destination) public returns(bool) {
        require(condition);

        bool success = false;
        assembly { success := call(gas, destination, 0, 0, 0, 0, 0) }
        return success;
    }
}