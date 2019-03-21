pragma solidity 0.4.24;

contract multisig02 {

    uint public threshold;

    function execute(bytes32[] sigR) view external returns (uint256) {
        require(sigR.length == threshold);

        return 5;
    }
}