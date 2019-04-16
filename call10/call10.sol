pragma solidity 0.4.24;

contract call10 {

    function execute(bool c, address destination, uint value, bytes data, uint gasLimit) public returns(bool) {
        require(c);

        bool success = false;
        assembly { success := call(gasLimit, destination, value, add(data, 0x20), mload(data), 0, 0) }
        require(success);
    }
}


create trusted K-spec about call statement