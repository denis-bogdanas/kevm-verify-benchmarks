pragma solidity 0.5.0;

contract ecrecover_multi_07 {

    uint constant THRESHOLD = 3;
    mapping(address => bool) isOwner;

    function get(uint8[3] memory sigV, bytes32[3] memory sigR, bytes32[3] memory sigS,
        address destination, bytes memory data, bytes32 totalHash) public returns(uint256) {

        address lastAdd = address(0);
        for (uint i = 0; i < THRESHOLD; i++) {
            address recovered = ecrecover(totalHash, sigV[i], sigR[i], sigS[i]);
            require(recovered > lastAdd && isOwner[recovered]);
            lastAdd = recovered;
        }

        return 5;
    }
}