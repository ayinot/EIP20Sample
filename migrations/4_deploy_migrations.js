var UniversalStorage = artifacts.require('./UniversalStorage.sol')
var ContractStorage = artifacts.require('./ContractStorage.sol')
var Contract = artifacts.require("./Contract.sol")

module.exports = function(deployer) {
  
  deployer.deploy(UniversalStorage).then(function(){
    deployer.deploy(ContractStorage).then(function(){
      deployer.deploy(Contract,UniversalStorage.address,ContractStorage.address,70000)
    })
  })
  

  
  
};
