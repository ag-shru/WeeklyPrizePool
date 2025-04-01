# Weekly Prize Pool Smart Contract

## Overview
This smart contract implements a weekly prize pool where participants can enter by sending ETH. A winner is automatically selected every week, and the prize pool is transferred to them.

## Features
- Users can enter the prize pool by sending ETH.
- A winner is randomly selected every 7 days.
- The entire balance is transferred to the winner.
- The participant list resets for the next round.

## Functions

### `enter()`
Allows a user to enter the prize pool by sending ETH.
- **Requires**: `msg.value > 0`
- **Effect**: Adds the sender's address to the participants list.

### `selectWinner()`
Selects a random winner from the participants list and transfers the prize pool.
- **Requires**: At least one week has passed since the last draw.
- **Requires**: There must be at least one participant.
- **Effect**: Transfers the contract's balance to the winner and resets participants.

### `getParticipants()`
Returns the list of current participants.

### `getPrizePool()`
Returns the current balance of the contract.

## Deployment
Deploy the contract on an Ethereum-compatible blockchain using a Solidity compiler (version 0.8.0 or later).

### Contract Address
- **Address**:0x8300c89C9b297072BF35DE468323A5d7BA332096
## Security Considerations
- The random selection method uses `keccak256`, which is not truly random on-chain. Consider integrating a secure randomness source like Chainlink VRF.
- Ensure sufficient gas fees are available for winner selection.
- The contract does not include an owner or admin; all users can interact freely.

## License
This project is open-source and available under the MIT License.
