//Dungo, Adrian Jeferson       NW - 301

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract DungoNW is ERC20{
    bytes32 public secretHash;

    constructor() ERC20("BLOCK","CON"){
        secretHash = "BLOCK";
    }
  
    function claimTokens(string memory _password, uint256 _amount)
    public {
        
        bytes32 inputHash = keccak256(abi.encodePacked(_password));
       require(inputHash == secretHash, "Hash do not match.");

       _mint(msg.sender, _amount);
    }
}

