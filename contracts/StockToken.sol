// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

// Add Swarm dOTC interface (simplified for demonstration)
interface ISwarmDOTC {
    function createOffer(address asset, uint256 amount, address counterparty) external;
}

contract StockToken is ERC20, Ownable {
    AggregatorV3Interface internal priceFeed;
    ISwarmDOTC internal swarmDOTC;

    constructor(uint256 initialSupply, address _priceFeed, address _swarmDOTC) ERC20("StockToken", "STK") Ownable(msg.sender) {
        _mint(msg.sender, initialSupply);
        priceFeed = AggregatorV3Interface(_priceFeed);
        swarmDOTC = ISwarmDOTC(_swarmDOTC);
    }

    // Function to get the latest stock price from Chainlink Oracle
    function getLatestPrice() public view returns (int) {
        (, int price,,,) = priceFeed.latestRoundData();
        return price;
    }

    // Enhanced function to tokenize stock with oracle price check
    function tokenizeStock(uint256 amount) public onlyOwner {
        // In a real RWA scenario, integrate with off-chain stock data via oracle
        int price = getLatestPrice();
        require(price > 0, "Invalid stock price");
        // Simulate tokenization based on stock value
        _mint(msg.sender, amount * uint256(price));
    }

    // Function to simulate redemption of stock
    function redeemStock(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Simulate Ondo Finance integration (Ondo does not provide direct stock API; this is a placeholder)
    // In real integration, use Ondo's protocol for tokenizing assets like bonds
    function integrateWithOndo(uint256 amount) public onlyOwner {
        // Placeholder: Call Ondo Finance's smart contract or API (not available for stocks)
        // For example, mint tokens representing Ondo USDY or OUSG
        _mint(msg.sender, amount);
    }

    // Additional educational function: transfer with fee simulation
    function transferWithFee(address recipient, uint256 amount) public returns (bool) {
        uint256 fee = amount / 100; // 1% fee
        _transfer(msg.sender, owner(), fee);
        _transfer(msg.sender, recipient, amount - fee);
        return true;
    }

    // Function to integrate with Swarm Markets dOTC for stock tokenization
    function integrateWithSwarm(address stockAsset, uint256 amount, address counterparty) public onlyOwner {
        // Simulate creating a dOTC offer for stock tokenization
        swarmDOTC.createOffer(stockAsset, amount, counterparty);
        // Mint tokens representing the tokenized stock
        _mint(msg.sender, amount);
    }
}