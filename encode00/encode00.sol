pragma solidity 0.4.24;

contract encode00 {

    function get(uint x) public returns(bytes) {
        return abi.encodePacked(x);
    }
}