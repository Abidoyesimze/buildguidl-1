// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IBatchRegistry {
	function checkIn() external;
}

contract CheckIn {
	IBatchRegistry public batchRegistry;
	address public owner;

	constructor(address _batchRegistryAddress) {
		batchRegistry = IBatchRegistry(_batchRegistryAddress);
		owner = 0x6BF7d6b94282BD48ff458599aDafA268BcB009FF;
	}

	modifier onlyOwner() {
		require(msg.sender == owner, "Not the owner");
		_;
	}

	function checkMeIn() external onlyOwner {
		batchRegistry.checkIn();
	}

	function transferOwnership(address newOwner) external onlyOwner {
		require(newOwner != address(0), "New owner cannot be zero address");
		owner = newOwner;
	}
}