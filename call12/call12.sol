pragma solidity 0.5.0;

contract call12 {

    function execute(bool condition, uint gasLimit, uint value, address destination) public returns(bool) {
        require(condition);

        bool success = false;
        assembly { success := call(gasLimit, destination, value, 0, 0, 0, 0) }
        require(success);
    }
}