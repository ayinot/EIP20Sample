pragma solidity ^0.4.18;

import "./utils/Proxy.sol";
import "./ContractStorage.sol";

import "./ContractStorageConsumer.sol";
import "./utils/universal_storage/UniversalStorage.sol";
import "./utils/universal_storage/UniversalStorageConsumer.sol";


contract Contract is UniversalStorageConsumer, ContractStorageConsumer, Proxy{

    function Contract(UniversalStorage ustorage_, ContractStorage lstorage_, uint256 _initialAmount)
        public
        UniversalStorageConsumer(ustorage_)
        ContractStorageConsumer(lstorage_)
    {
        // set some initial states in universal storage
        ustorage_.setString(keccak256("name"), "Contract");
        ustorage_.setUint256(keccak256("total_supply"), _initialAmount); // Set the initial total supply
        
    }
}