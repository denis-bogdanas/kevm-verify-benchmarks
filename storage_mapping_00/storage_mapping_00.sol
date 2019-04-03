pragma solidity 0.4.24;

contract storage_mapping_00 {
    mapping(address => bool) public isOwner;

    function isOwner(address x) external returns (bool) {
        return isOwner[x];
    }
}