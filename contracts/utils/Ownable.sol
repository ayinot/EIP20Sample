pragma solidity ^0.4.18;

import "./universal_storage/UniversalStorageStateful.sol";

/**
 * @title Ownable
 * @dev The Ownable contract has an owner address, and provides basic authorization control
 * functions, this simplifies the implementation of "user permissions".
 */
contract Ownable is UniversalStorageStateful {

  event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);


  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Ownable() public {
    _ustorage.setAddress(keccak256("owner"), msg.sender);
  }


  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    address owner = _ustorage.getAddress(keccak256("owner"));
    require(msg.sender == owner);
    _;
  }


  /**
   * @dev Allows the current owner to transfer control of the contract to a _newOwner.
   * @param _newOwner The address to transfer ownership to.
   */
  function transferOwnership(address _newOwner) public onlyOwner {
    require(_newOwner != address(0));

    address owner = _ustorage.getAddress(keccak256("owner"));
    OwnershipTransferred(owner, _newOwner);
    owner = _newOwner;
  }

}