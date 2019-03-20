pragma solidity 0.4.24;

contract simple08 {
    uint public y;

    function get5ifeq(uint[] xarr) view external returns (uint) {
        require(xarr.length == y);
        return 5;
    }
}