pragma solidity ^0.4.19;

import "zeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import './ERC223/ERC223_StandardToken.sol';

contract AMNToken is DetailedERC20, ERC223StandardToken {
    string constant  NAME = "Amon";
    string constant  SYMBOL = "AMN";
    uint8 constant   DECIMALS = 18;
    uint256 constant INITIAL_SUPPLY = (1.6 * 10 ** 9) * (uint256(10) ** DECIMALS);

    /**
      *@dev Constructor that set the token initial parameters
      */
    function AMNToken()
        DetailedERC20(NAME, SYMBOL, DECIMALS)
        public
    {
      totalSupply_ = INITIAL_SUPPLY;
      balances[msg.sender] = INITIAL_SUPPLY;
    }
}
