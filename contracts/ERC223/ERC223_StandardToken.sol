pragma solidity ^0.4.19;

import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

import './ERC223_BasicToken.sol';
import './ERC223_ReceivingInterface.sol';
import './ERC223_Utils.sol';

/**
 * @title ERC223 standard token implementation.
 */
contract ERC223StandardToken is ERC223BasicToken, StandardToken {

    using SafeMath for uint256;


    // Standard function transfer similar to ERC20 transfer with no _data .
    // Added due to backwards compatibility reasons .
    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {

      bytes memory empty;
      return transferFrom(_from, _to, _value, empty);

    }
    /**
     * @dev Transfer tokens from one address to another
     * @param _from address The address which you want to send tokens from
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amount of tokens to be transferred
     * @param _data bytes data to attach that will be stored as event
     */
    function transferFrom(address _from, address _to, uint256 _value, bytes _data) public returns (bool) {
      require(_to != address(0));
      require(_value <= balances[_from]);
      require(_value <= allowed[_from][msg.sender]);

      balances[_from] = balances[_from].sub(_value);
      balances[_to] = balances[_to].add(_value);
      allowed[_from][msg.sender] = allowed[_from][msg.sender].sub(_value);

      if(ERC223Utils.isContract(_to)) {
        ERC223ReceivingInterface receiver = ERC223ReceivingInterface(_to);
        receiver.tokenFallback(_from, _value, _data);
      }

      Transfer(_from, _to, _value);
      return true;
    }

}
