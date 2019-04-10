pragma solidity 0.4.24;

contract encode_packed_keccak_05 {

    function get() public returns(bytes32) {
        uint256 x = 5;
        return keccak256(abi.encodePacked(byte(25), byte(1), x));
    }
}