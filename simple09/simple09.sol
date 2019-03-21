pragma solidity 0.4.24;

contract simple09 {
    uint public y;

    function get5ifeq(uint[] xarr, uint[] zarr) view external returns (uint) {
        require(xarr.length == y);
        return 5;
    }
}