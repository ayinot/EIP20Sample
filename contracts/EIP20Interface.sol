// Abstract contract for the full ERC 20 Token standard
// https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md
pragma solidity ^0.4.18;


contract EIP20Interface {
    /**
    * @notice - the current total supply of tokens
    * @return supply - the total `supply`
    */
    function totalSupplyOf() public view  returns (uint256 supply);

    /**
    * @param _account - the `_account` from which the `balance` will be retrieved
    * @return balance - the current `balance` of `_account`
    */
    function balanceOf(address _account) public view returns (uint256 balance);

    /**
    * @notice - sends `_value` tokens to `_to` from `msg.sender`
    * @param _to - the address of the recipient
    * @param _value - the amount of tokens to be transferred
    * @return success - whether the transfer was successful or not
    */
    function transfer(address _to, uint256 _value) public returns (bool success);

    /**
    * @notice - `msg.sender` approves `_spender` to spend `_value` tokens on `msg.sender`'s behalf
    * @param _spender - the address of the account allowed to transfer the tokens
    * @param _value - the amount of tokens to be transferred
    * @return success - whether the transfer was successful or not
    */
    function approve(address _spender, uint256 _value) public returns (bool success);

    /**
    * @notice - sends `_value` tokens to `_to` from `_from` on the condition it is approved by `_from`
    * @param _from - the address of the sender/approver
    * @param _to - the address of the recipient
    * @param _value - the amount of tokens to be transferred
    * @return success - whether the transfer was successful or not
    */
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success);

    /**
    * @param _account - the address of the account owning tokens
    * @param _spender - the address of the account allowed to transfer the tokens
    * @return remaining - amount of remaining tokens allowed to spent
    */
    function getAllowance(address _account, address _spender) public view returns (uint256 remaining);

    /**
    * @notice - Log for a `transfer` event
    * @param _from - the address of the sender
    * @param _to -the address of the recipient
    * @param _value - the amount of tokens transferred
    */
    event Transfer(address indexed _from, address indexed _to, uint256 _value); 
    
    /**
    * @notice - Log for an `approve` event
    * @param _account - the address of the account owning tokens
    * @param _spender - the address of the account allowed to transfer the tokens
    * @param _value - the amount of tokens transferred
    */
    event Approval(address indexed _account, address indexed _spender, uint256 _value);
}