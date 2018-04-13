var DSMathLib = artifacts.require("./libs/DSMathLib.sol");
var contractV1Lib = artifacts.require("./V1/ContractV1Lib.sol");
var contractV2 = artifacts.require('./V2/ContractV2.sol')

module.exports = function(deployer) {
  deployer.deploy(DSMathLib);
  deployer.deploy(contractV1Lib);
  deployer.link(contractV1Lib,contractV2);
  deployer.link(DSMathLib,contractV2);

  deployer.deploy(contractV2)
  //console.log("ContractV2.address",contractV2.address);
  
};
