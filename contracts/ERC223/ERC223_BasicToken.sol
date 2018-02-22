pragma solidity ^0.4.19;

import "zeppelin-solidity/contracts/token/ERC20/BasicToken.sol";

import './ERC223_Interface.sol';
import './ERC223_ReceivingInterface.sol';
import './ERC223_Utils.sol';

/**
 * @title ERC223 basic token implementation.
 */
contract ERC223BasicToken is ERC223Interface, BasicToken {

    using SafeMath for uint256;

    function() public {
        //if ether is sent to this address, send it back.
        revert();
    }

    // Standard function transfer similar to ERC20 transfer with no _data .
    // Added due to backwards compatibility reasons .
    function transfer(address _to, uint _value) public returns (bool success) {

      bytes memory empty;
      return transfer(_to, _value, empty);

    }

    /**
     * @dev Transfer tokens to another from sender
     * @param _to address The address which you want to transfer to
     * @param _value uint256 the amount of tokens to be transferred
     * @param _data bytes data to attach that will be stored as event
     */
    function transfer(address _to, uint _value, bytes _data) public returns (bool success) {

      if((_to == address(0))) revert();
      if(_value > balances[msg.sender]) revert();

      balances[msg.sender] = balances[msg.sender].sub(_value);
      balances[_to] = balances[_to].add(_value);

      if(ERC223Utils.isContract(_to)) {
        ERC223ReceivingInterface receiver = ERC223ReceivingInterface(_to);
        receiver.tokenFallback(msg.sender, _value, _data);
      }

      Transfer(msg.sender, _to, _value);
      return true;

  }

}
