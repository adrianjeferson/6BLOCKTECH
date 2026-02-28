// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyMultiToken is ERC1155, Ownable {

    constructor() ERC1155("https://example.com/{id}.json")Ownable(msg.sender) {
        _mint(msg.sender, 1, 1000, "");
        _mint(msg.sender, 2, 5000, "");
        _mint(msg.sender, 3, 100, "");
    }

    function mint(address to, uint256 id, uint256 amount) public onlyOwner {
        _mint(to, id, amount, "");
    }

    function burn(address from, uint256 id, uint256 amount) public {
    require(from == msg.sender, "You can only burn your own tokens");
    _burn(from, id, amount);
    }
}

//0xb5189c597b6017672e52977dA7ecBb07597D32Fc
//0x3D48BC7143F45F9Db67Aec69e05f93eD7CBDBE05