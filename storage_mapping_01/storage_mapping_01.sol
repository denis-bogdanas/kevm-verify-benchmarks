pragma solidity 0.4.24;

contract storage_mapping_01 {
    mapping(address => bool) public isOwnerMap;

    function isOwner(address x) external returns (bool) {
        return isOwnerMap[x];
    }
}

