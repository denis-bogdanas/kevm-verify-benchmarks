pragma solidity 0.4.24;

contract simple06 {

    function get5ifeq(uint x, uint y) pure external returns (uint) {
        require(x == y);
        return 5;
    }
}