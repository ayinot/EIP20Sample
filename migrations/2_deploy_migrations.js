var DSMathLib = artifacts.require("./libs/DSMathLib.sol");
var contractV1Lib = artifacts.require("./V1/ContractV1Lib.sol");
var contractV1 = artifacts.require('./V1/ContractV1.sol')

module.exports = function(deployer) {
  deployer.deploy(DSMathLib);
  deployer.deploy(contractV1Lib);
  deployer.link(contractV1Lib,contractV1);
  deployer.link(DSMathLib,contractV1);

  deployer.deploy(contractV1)
  //console.log("ContractV1.address",contractV1.address);
  
};
