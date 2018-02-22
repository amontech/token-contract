const HDWalletProvider = require("truffle-hdwallet-provider");
require('dotenv').config();

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*" // Match any network id
    },
    kovan_infura: {
      provider: () => new HDWalletProvider(process.env.MNEMONIC, `https://kovan.infura.io/${process.env.INFURA_KEY}`),
      network_id: '42',
      gasPrice: 20000000000,
    },
    rinkeby_infura: {
      provider: () => new HDWalletProvider(process.env.MNEMONIC, `https://rinkeby.infura.io/${process.env.INFURA_KEY}`),
      network_id: '4',
      gasPrice: 2400000000,
    },
  },
  solc: {
    optimizer: {
      enabled: true,
      runs: 200
    }
  }
};
