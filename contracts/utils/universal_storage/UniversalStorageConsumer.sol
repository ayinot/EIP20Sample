pragma solidity ^0.4.18;

import "./UniversalStorage.sol";
import "./UniversalStorageStateful.sol";

contract UniversalStorageConsumer is UniversalStorageStateful {
function UniversalStorageConsumer(UniversalStorage ustorage_) public {
    _ustorage = ustorage_;
}
}