/*
Implements EIP20 token standard: https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md, as a Proxy design pattern
* Plus minting and burning functionality
*/

pragma solidity ^0.4.18;

import "../V1/ContractV1.sol";
import "../libs/DSMathLib.sol";


contract ContractV2 is ContractV1 {

    function increaseSupply(uint256 _amount) {
        require(msg.sender == _ustorage.getAddress(keccak256("owner"))); // only the owner can increase the supply of tokens
        uint256 currentSupply = _ustorage.getUint256(keccak256("total_supply"));
        _ustorage.setUint256(keccak256("total_supply"), DSMathLib.dsadd(currentSupply, _amount));
    }

    function decreaseSupply(uint256 _amount) {
        require(msg.sender == _ustorage.getAddress(keccak256("owner"))); // only the owner can decrease the supply of tokens
        uint256 currentSupply = _ustorage.getUint256(keccak256("total_supply"));
        _ustorage.setUint256(keccak256("total_supply"), DSMathLib.dssub(currentSupply, _amount));
    }

}