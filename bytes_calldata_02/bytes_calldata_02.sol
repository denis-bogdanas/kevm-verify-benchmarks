pragma solidity 0.4.24;

contract bytes_calldata_02 {

    function getLength(bytes x) pure external returns (uint) {
        return x.length;
    }
}