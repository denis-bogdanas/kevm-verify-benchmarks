pragma solidity 0.4.24;

contract simple07 {

    function get5ifeq(uint[] xarr, uint y) pure external returns (uint) {
        require(xarr.length == y);
        return 5;
    }
}