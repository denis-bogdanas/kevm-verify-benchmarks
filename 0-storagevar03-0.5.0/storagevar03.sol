pragma solidity 0.5.0;
contract storagevar03 {
    uint private n;

    function execute() public {
        n = 5;
        require(false);
    }
}

