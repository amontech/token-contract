# AMN Token

Source code for Amon Token (AMN) Ethereum smart contract.


## Description

This token respects the ERC20 standard. And is 

## Addresses

- *Mainnet*: [0x737f98ac8ca59f2c68ad658e3c3d8c8963e40a4c](https://etherscan.io/token/0x737f98ac8ca59f2c68ad658e3c3d8c8963e40a4c)
- *Kovan*: [0x5870042b67353a2e037c76777f3bd7d0ef222762](https://kovan.etherscan.io/token/0x5870042b67353a2e037c76777f3bd7d0ef222762)

## Dependencies versions
  - Truffle 4.0.6
  - OpenZeppelin 1.7.0
  - Solidity 0.4.19
  
## Test

`$ npm test`

## Flatten

This will replace imports in solidity to get only one file. 
Useful for Etherscan code verification.

Saved in `./build/AMNTokenFlat.sol`

`$ npm run flatten`

## Deploy

`$ npm run deploy:network` network=[kovan,rinkeby,mainnet]

Artifacts are saved inside  `./build/contracts/`