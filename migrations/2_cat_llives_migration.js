var Migrations = artifacts.require("CatLives");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
};
