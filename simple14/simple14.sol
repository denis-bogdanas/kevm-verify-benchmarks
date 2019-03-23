pragma solidity 0.4.24;

contract simple14 {
    uint public y;

    function get5ifeq(uint x, bytes32[] zarr) view external returns (uint) {
        require(zarr.length == y);
        return 5;
    }
}