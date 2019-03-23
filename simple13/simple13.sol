pragma solidity 0.4.24;

contract simple13 {
    uint public y;

    function get5ifeq(bytes32[] zarr) view external returns (uint) {
        require(zarr.length == y);
        return 5;
    }
}