// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract StockToken is ERC20, Ownable {
    constructor(uint256 initialSupply) ERC20("StockToken", "STK") Ownable(msg.sender) {
        _mint(msg.sender, initialSupply);
    }

    // Function to simulate tokenizing real-world stock (only owner can call)
    function tokenizeStock(uint256 amount) public onlyOwner {
        // In a real RWA scenario, this would integrate with off-chain stock data
        _mint(msg.sender, amount);
    }

    // Function to burn tokens, simulating redemption of stock
    function redeemStock(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Additional educational function: transfer with fee simulation
    function transferWithFee(address recipient, uint256 amount) public returns (bool) {
        uint256 fee = amount / 100; // 1% fee
        _transfer(msg.sender, owner(), fee);
        _transfer(msg.sender, recipient, amount - fee);
        return true;
    }
}