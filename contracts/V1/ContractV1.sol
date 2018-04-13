/*
Implements EIP20 token standard: https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md, as a Proxy design pattern
.*/

pragma solidity ^0.4.18;

import "../EIP20Interface.sol";
import "../libs/DSMathLib.sol";
import "./ContractV1Lib.sol";
import "../utils/universal_storage/UniversalStorageStateful.sol";
import "../ContractStorageStateful.sol";


contract ContractV1 is UniversalStorageStateful, ContractStorageStateful, EIP20Interface{

    // description in EIP20Interface.sol
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0) && _to != msg.sender); // cannot send to null address or self
        require(_value <= balanceOf(msg.sender)); // msg.sender must have enough funds to cover _value
        
        if (_value == 0) {  // if transfer _value is 0 just log the event
            Transfer(msg.sender, _to, _value);
            return true;
        }

        subBalance(msg.sender, _value); // subtract tokens from msg.sender
        addBalance(_to, _value);        // add tokens to _to
        
        Transfer(msg.sender, _to, _value); // Log the event
        
        return true; // return success == true
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        setAllowance(msg.sender, _spender, _value); // msg.sender approves _spender to transfer up to _value on their behalf

        Approval(msg.sender, _spender, _value); // Log the approval event
        
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        uint256 allowance = getAllowance(_from, msg.sender); // get the allowed amount for msg.sender approved by _from
        require(_to != address(0)); // cannot send to null address
        require(_value <= balanceOf(_from) && _value <= allowance); // check that _value is less than or equal to _from's balance and _value is less than or equal to allowance

        if (_value == 0) { // if transfer _value is 0 just log the event
          Transfer(_from, _to, _value);
            return true;
        }

        subBalance(_from,_value);  // subtract tokens from _from
        addBalance(_to,_value);    // add tokens to _to

        if (allowance < 2**256 - 1) { // if the original allowance does not overflow uint256, reduce the allowance assigned to sender by _value
            subAllowance(_from, msg.sender, _value);
        }

        Transfer(_from, _to, _value); // Log the transfer event

        return true;
    }

    // not included in ERC-20 interface definition
    function claimInitialSupply() public {
        require(msg.sender == _ustorage.getAddress(keccak256("owner"))); // only the owner can claim the initial supply of tokens
        uint256 initialAmount = _ustorage.getUint256(keccak256("total_supply"));
        setBalance(msg.sender, initialAmount);
    }


    // getters
    function balanceOf(address _account) public view returns (uint256 balance) {
        return ContractV1Lib.getBalance(_ustorage, _account); // ContractV1Lib call
    }

    function getAllowance(address _account, address _spender) public view returns (uint256 remaining) {
        return ContractV1Lib.getAllowance(_ustorage, _account, _spender); // ContractV1Lib call
    }   

    function totalSupplyOf() public view returns (uint256 totalSupply) {
        return ContractV1Lib.getTotalSupply(_ustorage);
    }

    // manipulators
    function addBalance(address _account, uint256 _value) internal {
        setBalance(_account, DSMathLib.dsadd(ContractV1Lib.getBalance(_ustorage, _account), _value)); // DSMathLib call
    }

    function subBalance(address _account, uint256 _value) internal {
        setBalance(_account, DSMathLib.dssub(ContractV1Lib.getBalance(_ustorage, _account), _value));
    }

    function subAllowance(address _account, address _spender, uint256 _value) internal {
        setAllowance(_account, _spender, DSMathLib.dssub(ContractV1Lib.getAllowance(_ustorage, _account, _spender), _value));
    }

    // setters
    function setBalance(address _account, uint256 _value) internal {
        _ustorage.setUint256(keccak256("balances", _account), _value);
    }

    function setAllowance(address _account, address _spender, uint256 _value) internal {
        _ustorage.setUint256(keccak256("allowance", _account, _spender), _value);
    }

}       