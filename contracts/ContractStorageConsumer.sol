pragma solidity ^0.4.18;

import "./ContractStorage.sol";
import "./ContractStorageStateful.sol";

contract ContractStorageConsumer is ContractStorageStateful {
  function ContractStorageConsumer(ContractStorage lstorage_) public {
    _lstorage = lstorage_; // 'l' for local storage
  }
}