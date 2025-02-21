# Staking-Rewards-
# Staking Rewards

## Project Description
The **Staking Rewards** project allows users to stake their tokens and earn rewards over time. The rewards are distributed based on the amount of tokens staked and the time the tokens remain staked. This is implemented using a smart contract written in Solidity.

Users can deposit tokens into the contract and earn rewards which can be claimed periodically. The reward rate is fixed and calculated based on the number of blocks passed since the last claim.

## Smart Contract Address
The deployed contract address on the blockchain is:

**0xA615E6Be3749436AFbb713B11602f16CA8f08B2b**

## Features
- Stake tokens to earn rewards.
- Claim rewards based on staked amount and the time passed since the last claim.
- No constructor or input fields—users simply interact by staking and claiming.
- Simulated block passing for testing.

## Functions
### `stake(uint256 _amount)`
- Stakes tokens in the contract.
- _amount_: The amount of tokens to stake.

### `claim()`
- Claims rewards based on the user's staked tokens.
  
### `pendingRewards(address _user)`
- Returns the calculated rewards available for a specific user.

### `nextBlock()`
- Simulates the passage of blocks (useful for testing).

## How to Use
1. Deploy the contract on your desired network.
2. Stake your tokens using the `stake` function.
3. Monitor your rewards by calling the `pendingRewards` function.
4. Claim your rewards by calling the `claim` function.

## Example Usage

1. **Stake tokens**:  
   Call the `stake(uint256 _amount)` function to deposit your tokens into the contract. You can stake any amount of tokens.

2. **Claim rewards**:  
   To claim your rewards, call the `claim()` function. The contract will calculate your rewards based on the time passed since your last claim.

3. **Check pending rewards**:  
   Use the `pendingRewards(address _user)` function to check how much reward is pending for a specific user.

## License
This project is licensed under the MIT License.

## Contact
For further information or inquiries, please contact [your-email@example.com](mailto:your-email@example.com).
