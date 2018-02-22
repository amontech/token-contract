pragma solidity ^0.4.19;

 /**
 * @title Contract that will work with ERC223 tokens.
 */

contract ERC223ReceivingContract {

    event TokenDeposit(address indexed sender, address indexed token, uint value, bytes _data);

    /**
     * @dev Standard ERC223 function that will handle incoming token transfers.
     *
     * @param _from  Token sender address.
     * @param _value Amount of tokens.
     * @param _data  Transaction metadata.
     */
    function tokenFallback(address _from, uint _value, bytes _data) public {

        if (_value > 0)
            TokenDeposit(_from, msg.sender, _value, _data);

    }
}
