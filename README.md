# AMN Token

Source code for Amon Token (AMN) Ethereum smart contract.


## Description

This token respects the ERC20 standard. And is 

## Addresses

- *Mainnet*: [0x0a45005dc516d5243c4ac89345e1f95959b4ebaa](https://etherscan.io/token/0x0a45005dc516d5243c4ac89345e1f95959b4ebaa)
- *Kovan*: [0x811a966331231fc308b173ade678978e21a910c4](https://kovan.etherscan.io/token/0x811a966331231fc308b173ade678978e21a910c4)

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