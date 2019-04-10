pragma solidity 0.4.24;

contract storage_mapping_02 {
    mapping(address => uint8) public isOwnerMap;

    function isOwner(address x) external returns (uint8) {
        return isOwnerMap[x];
    }
}

