pragma solidity 0.5.0;

contract bytes_calldata_02 {

    function getLength(bytes memory x) pure public returns (uint) {
        return x.length;
    }
}