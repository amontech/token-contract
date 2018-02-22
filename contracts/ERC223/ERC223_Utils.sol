pragma solidity ^0.4.19;

/**
 * @title ERC223Utils
 * @dev Detect contracts
 */
library ERC223Utils {

    //assemble the given address bytecode. If bytecode exists then the _addr is a contract.
    function isContract(address _addr) public view returns (bool is_contract) {
      uint length;
      assembly {
            //retrieve the size of the code on target address, this needs assembly
            length := extcodesize(_addr)
      }
      return (length>0);
    }

}
