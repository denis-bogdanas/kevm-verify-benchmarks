pragma solidity 0.4.24;

contract arraystatic01 {

    function get5(uint[3] x) pure external returns (uint) {
        return x[1];
    }
}

