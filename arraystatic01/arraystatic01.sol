pragma solidity 0.5.0;

contract arraystatic01 {

    function get5(uint[3] memory x) public returns (uint) {
        return x[1];
    }
}

