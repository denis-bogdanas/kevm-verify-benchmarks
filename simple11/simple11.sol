pragma solidity 0.4.24;

contract simple11 {
    uint public y;

    function get5ifeq(uint8[] xarr, bytes32[] zarr) view external returns (uint) {
        require(xarr.length == y);
        return 5;
    }
}