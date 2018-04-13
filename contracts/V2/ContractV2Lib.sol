pragma solidity ^0.4.18;

import "../utils/universal_storage/UniversalStorage.sol";
import "../ContractStorage.sol";

library ContractV2Lib {

    function getBalance(UniversalStorage self, address _account) public view returns (uint256) {
        return self.getUint256(keccak256("balances", _account));
    }

    function getAllowance(UniversalStorage self, address _account, address _spender) public view returns (uint256) {
        return self.getUint256(keccak256("allowance", _account, _spender));
    }

}