pragma solidity 0.4.24;

contract ecrecover04 {

    function get(bytes32 arg0, bytes32 arg1, uint8 sigV, bytes32 sigR, bytes32 sigS) public returns(uint256) {
        bytes32 hash = keccak256(abi.encodePacked("\x19\x01", arg0, arg1));
        address recovered = ecrecover(hash, sigV, sigR, sigS);
        require(recovered > 0);
        return 5;
    }
}