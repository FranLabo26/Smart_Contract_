const Nfts = artifacts.require("Nfts");

module.exports = function (deployer) {
  deployer.deploy(Nfts, 'FIAMBRES', 'NFTS');
};