pragma solidity 0.5.0;
contract call01 {
    uint public nonce;

    function execute(bool condition, uint gasLimit, uint value, bytes memory data, address destination) public {
        require(condition);
        nonce = nonce + 1;
        bool success = false;
        assembly { success := call(gasLimit, destination, value, add(data, 0x20), mload(data), 0, 0) }
        require(success);
    }
}
