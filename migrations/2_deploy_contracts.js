/*
var AMNToken = artifacts.require("AMNToken");

module.exports = function(deployer) {
  deployer.deploy(AMNToken);
};

*/
const ERC223Utils = artifacts.require('ERC223/ERC223Utils');
const AMNToken = artifacts.require('AMNToken');

module.exports = function (deployer) {
    deployer.deploy(ERC223Utils).then(() => {
        deployer.deploy(AMNToken);
    });
    deployer.link(ERC223Utils, AMNToken);
};
