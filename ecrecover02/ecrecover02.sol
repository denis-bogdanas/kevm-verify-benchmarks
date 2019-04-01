pragma solidity 0.4.24;

contract ecrecover02 {

    function get(bytes32 hash, uint8 sigV, bytes32 sigR, bytes32 sigS) public returns(uint256) {
        address recovered = ecrecover(hash, sigV, sigR, sigS);
        require(recovered > 0);
        return 5;
    }
}