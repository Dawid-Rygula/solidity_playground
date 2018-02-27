var Migrations = artifacts.require("./utility_contract/Migrations.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};
