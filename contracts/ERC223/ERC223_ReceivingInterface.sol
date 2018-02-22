pragma solidity ^0.4.19;

 /**
 * @title Interface for ERC223 Receiving Contract.
 */

contract ERC223ReceivingInterface {

    function tokenFallback(address _from, uint _value, bytes _data) public;

}
