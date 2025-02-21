// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Staking {

    // Token mapping to track staked amounts
    mapping(address => uint256) public stakes;
    
    // Total amount of tokens staked in the contract
    uint256 public totalStaked;
    
    // Mapping to store the last time a user claimed rewards
    mapping(address => uint256) public lastClaimed;
    
    // Reward rate (e.g., 1% per block)
    uint256 public rewardRate = 100;  // 100 = 1% per block
    
    // To simulate the passage of time (could be block number, block timestamp, etc.)
    uint256 public currentBlock;

    // Event to notify when a user stakes tokens
    event Staked(address indexed user, uint256 amount);
    
    // Event to notify when a user claims rewards
    event Claimed(address indexed user, uint256 reward);

    // Function to simulate moving to the next block (used in testing)
    function nextBlock() public {
        currentBlock += 1;
    }
    
    // Stake function that allows users to deposit tokens
    function stake(uint256 _amount) public {
        require(_amount > 0, "Cannot stake 0 tokens");

        stakes[msg.sender] += _amount;
        totalStaked += _amount;
        lastClaimed[msg.sender] = currentBlock;
        
        emit Staked(msg.sender, _amount);
    }

    // Claim function to allow users to claim rewards based on their stake
    function claim() public {
        uint256 stakedAmount = stakes[msg.sender];
        require(stakedAmount > 0, "No staked tokens to claim rewards");

        uint256 blocksPassed = currentBlock - lastClaimed[msg.sender];
        uint256 reward = (stakedAmount * rewardRate * blocksPassed) / 10000;

        lastClaimed[msg.sender] = currentBlock;
        
        emit Claimed(msg.sender, reward);
    }

    // Function to check the total rewards available for a user
    function pendingRewards(address _user) public view returns (uint256) {
        uint256 stakedAmount = stakes[_user];
        if (stakedAmount == 0) return 0;

        uint256 blocksPassed = currentBlock - lastClaimed[_user];
        return (stakedAmount * rewardRate * blocksPassed) / 10000;
    }
}
