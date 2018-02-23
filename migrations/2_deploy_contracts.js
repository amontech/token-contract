const AMNToken = artifacts.require("AMNToken");

module.exports = function(deployer) {
  deployer.deploy(AMNToken);
};
