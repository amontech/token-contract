pragma solidity ^0.4.11;
import "zeppelin-solidity/contracts/token/StandardToken.sol";

contract AMNToken is StandardToken {
  string public name = "AMON";
  string public symbol = "AMN";
  uint public decimals = 18;
  uint public INITIAL_SUPPLY = (500 * 10 ** 6) * (10 ** decimals);

  function AMNToken() {
    totalSupply = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
  }
}
