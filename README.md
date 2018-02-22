# AMN Token

Source code for Amon Token (AMN) Ethereum smart contract.


## Description
This token respects the ERC20 and ERC223 standards.

### Dependencies
  - Truffle
  - OpenZeppelin
  - Solidity

### Implemented methods

- transfer(address to, uint value[, bytes data]) *(needs `tokenFallback` method on `to` if it is a contract)*
- totalSupply()
- balanceOf(address owner)
- transferFrom(address from, address to, uint256 value[, bytes data]) *(needs `tokenFallback` method on `to` if it is a contract)*
- approve(address spender, uint256 value)
- allowance(address owner, address spender)
- increaseApproval(address spender, uint addedValue)
- decreaseApproval(address spender, uint subtractedValue)

### Contract inheritances

DetailedERC20:
name, symbol, decimals

BasicToken
transfer, totalSupply, balanceOf

StandardToken:
transferFrom, approve, allowance, increaseApproval, decreaseApproval, BasicToken

ERC223BasicToken:
transfer, BasicToken

ERC223StandardToken:
transferFrom, ERC223BasicToken, StandardToken

AMNToken:
DetailedERC20, ERC223StandardToken
