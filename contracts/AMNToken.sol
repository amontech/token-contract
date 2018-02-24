pragma solidity ^0.4.19;
import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract AMNToken is StandardToken {

  string  public constant name = "Amon";
  string  public constant symbol = "AMN";
  uint8   public constant decimals = 18;
  uint256 public constant INITIAL_SUPPLY = (1.6 * 10 ** 9) * (uint256(10) ** decimals);

  /**
    *@dev Constructor that set the token initial parameters
    */
  function AMNToken()
  public
  {
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = totalSupply_;
  }

}
