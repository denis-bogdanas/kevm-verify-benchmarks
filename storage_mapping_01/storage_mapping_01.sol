pragma solidity 0.4.24;

contract storage_mapping_01 {
    mapping(address => uint256) public isOwnerMap;

    function isOwner(address x) external returns (uint256) {
        return isOwnerMap[x];
    }
}

