# EIP20Sample

This repository implements EIP20 token standard: https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md, as a Proxy design pattern. The usage of it is explained in this article https://medium.com/@toniya.sundaram/upgrading-smart-contracts-in-simple-terms-72c95221ad10.

#prerequisite
1. Truffle should be installed using npm unpack webpack. 
2. Clone this repository and replace the contracts, migrations and test folders. 

#utils/universal_storage/UniversalStorage.sol   
This contract uses key_value architechture which defines mappings of mappings to store all the variable types. It has all getters and setters for storing a variable and reteiving the variable from storage. This is a permenant storage.  
Eg:
_unitStorage    
    <ContractV1_address>
        <"total_supply">: 1000

#Contract.sol
Contract is a proxy contract. This implements the delegate call to proxy all the transactions. This inherits UniversalStorageConsumer,ContractStorageConsumer and Proxy. This has a constructor which accepts the address of the UniversalStorage and ContractStorage and passes it to the respective Storageconsumers. It also sets the initial amount and contract name.

#utils/Proxy.sol
Proxy doesnot know anything about the implemented functions but it justs delegates the function calls. It sets and resets the implementation address. It uses assembly code to implement delegatecall in fallback. Proxy is a ownable contract which restricts its usage only by its owner.

#utils/universal_storage/UniversalStorageConsumer.sol
Sets the universalStorage variable to the consrtuctor.This inherits UniversalStorageStateful

#utils/universal_storage/UniversalStorageStateful.sol
This contract has the global storage variable for the universalStorage.

#ContractStorageConsumer.sol, ContractStorageStateful.sol
This is similar to the UniversalStorage expect to the fact these are contract specific.

#ContractV1.sol
This implements EIP20 token standard and has all its functions. This inherits from UniversalStorageStateful, ContractStorageStateful, EIP20Interface. This also imports DSMathLib and ContractV1Lib. 

#ContractV1Lib.sol
It encapsulates the business logic : implementation of getBalance and getAllowance. 

#ContractV2.sol  
This inherits all functionality of ContractV1 and add additional functionality to V1. 

#EIP20Interface.sol
This decouples the intercontract communication which has all the abstract functions used in all versions of contract.

#DSMathLib
A robust and advanced math library originally developed by Dapphub. Augmented slightly here to handle division flooring as well as rounding.






