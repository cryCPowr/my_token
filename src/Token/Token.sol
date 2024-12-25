// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin-contracts/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin-contracts/contracts/access/Ownable.sol";


contract TokenOwnable is ERC20, ERC20Burnable, Ownable {

    string public constant TOKEN_NAME = "Ownable Time";
    string public constant TOKEN_SYMBOL = "OWNABLE TIME";
    uint256 public constant TOTAL_SUPPLY = 116_160_000_000 * 10 ** 18; 

    constructor() 
    ERC20(TOKEN_NAME, TOKEN_SYMBOL) 
    Ownable(msg.sender) 
    {
    _mint(msg.sender, TOTAL_SUPPLY);
    }

    function renounceOwnership() public override onlyOwner {
       revert("Ownership cannot be renounced.");
    }
}