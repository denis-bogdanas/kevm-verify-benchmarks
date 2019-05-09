pragma solidity 0.5.0;

contract call10 {

    function execute(bool condition, uint gasLimit, address destination) public returns(bool) {
        require(condition);

        bool success = false;
        assembly { success := call(gasLimit, destination, 0, 0, 0, 0, 0) }
        require(success);
    }
}