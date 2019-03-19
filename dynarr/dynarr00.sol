pragma solidity ^0.5.5;

contract dynarr00 {

    function len(uint[] calldata arr) pure external returns (uint) {
        return arr.length;
    }
}