pragma solidity 0.5.0;

contract ecrecover_rv_ver1 {

    uint constant THRESHOLD = 2;

    function get(bytes memory data, bytes32 hash) public returns(uint256) {
        address recovered = ecrecover(hash, uint8(1), bytes32(uint(1)), bytes32(uint(1)));
        require(recovered > address(0));

        return 5;
    }
}