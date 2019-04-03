pragma solidity 0.4.24;

contract call00 {

    function execute(address destination, uint gasLimit) public returns(bool) {
        bool success = false;
        assembly { success := call(gasLimit, destination, 0, 0, 0, 0, 0) }
        return success;
    }
}