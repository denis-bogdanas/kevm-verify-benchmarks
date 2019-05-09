pragma solidity 0.5.0;

contract bytes_calldata_03 {

    function getLength(bytes memory x) pure public returns (uint) {
        uint len;

        assembly { len := mload(x) }

        return len;
    }
}