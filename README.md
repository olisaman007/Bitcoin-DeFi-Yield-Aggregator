# Clarity Liquidity Pool

## Overview
This project is a decentralized liquidity pool smart contract built using Clarity on the Stacks blockchain. The contract enables users to deposit and withdraw funds securely while maintaining a transparent and immutable record of all transactions. The contract owner can set a transaction fee rate and transfer ownership when needed.

## Features
- **Deposit Funds:** Users can add liquidity to the pool.
- **Withdraw Funds:** Users can withdraw their deposited liquidity.
- **Fee Management:** The contract owner can set a fee rate for transactions.
- **Ownership Transfer:** The contract owner can transfer ownership to another account.
- **Security Checks:** Proper assertions are in place to prevent unauthorized actions and invalid transactions.

## Smart Contract Functions
### Public Functions
- `deposit (amount uint)`: Allows users to deposit a specified amount into the liquidity pool.
- `withdraw (amount uint)`: Allows users to withdraw a specified amount from their liquidity balance.
- `set-fee-rate (new-rate uint)`: Enables the contract owner to modify the transaction fee rate.
- `transfer-ownership (new-owner principal)`: Allows the current owner to transfer ownership to a new account.

### Read-Only Functions
- `get-liquidity (account principal)`: Returns the liquidity balance of a specific user.
- `get-total-liquidity ()`: Returns the total liquidity stored in the pool.
- `get-fee-rate ()`: Returns the current transaction fee rate.

## Deployment & Usage
### Prerequisites
- Stacks blockchain development environment
- Clarity language installed
- Clarinet for testing and debugging

### Steps to Deploy
1. Clone this repository.
2. Use Clarinet to check and deploy the contract:
   ```sh
   clarinet check
   clarinet test
   clarinet deploy
   ```
3. Interact with the contract using Clarity functions.

## Best Practices & Security
- All critical operations require authorization to prevent unauthorized access.
- Input validations are enforced to ensure safe and fair transactions.
- The contract follows Clarity best practices, ensuring readability and maintainability.

## License
This project is open-source and available under the MIT License.

---

