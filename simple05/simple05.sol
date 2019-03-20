pragma solidity 0.4.24;

contract simple05 {

    function getLength(uint[] x) pure external returns (uint) {
        return x.length;
    }
}