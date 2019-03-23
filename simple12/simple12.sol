pragma solidity 0.4.24;

contract simple12 {
    uint public y;

    function get5ifeq(uint8[] xarr, bytes32[] zarr) view external returns (uint) {
        require(zarr.length == y);
        return 5;
    }
}