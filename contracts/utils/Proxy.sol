pragma solidity ^0.4.18;

import "./Ownable.sol";

contract Proxy is Ownable {

  event Upgraded(address indexed implementation, uint version);

  function getImplementation() public view returns (address) {
     return _ustorage.getAddress(keccak256("current_implementation"));
  }

  function getVersion() public view returns (uint256) {
    return _ustorage.getUint256(keccak256("current_version"));
  }

  function upgradeTo(address _impl) public onlyOwner {
    
    uint256 version = _ustorage.getUint256(keccak256("version", _impl));

    require(version == 0); // implementation address must not be already assigned a version (assigned implementations are on old addresses that will have non-zero versions)
    _ustorage.setAddress(keccak256("current_implementation"),_impl);
    uint256 oldVersion = getVersion();
    _ustorage.setUint256(keccak256("version",_impl), oldVersion + 1);

    Upgraded(getImplementation(), getVersion());
  }
 
  function () payable public {
    address impl = getImplementation();
    require(impl != address(0));
    bytes memory data = msg.data;

    assembly {
      let result := delegatecall(gas, impl, add(data, 0x20), mload(data), 0, 0)
      let size := returndatasize
      let ptr := mload(0x40)
      returndatacopy(ptr, 0, size)
      switch result
      case 0 { revert(ptr, size) }
      default { return(ptr, size) }
    }
  }
}