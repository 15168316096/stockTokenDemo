const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('StockToken', function () {
  let StockToken;
  let stockToken;
  let owner;
  let addr1;

  beforeEach(async function () {
    StockToken = await ethers.getContractFactory('StockToken');
    [owner, addr1] = await ethers.getSigners();
    stockToken = await StockToken.deploy(1000000);
  });

  it('Should deploy with initial supply', async function () {
    expect(await stockToken.totalSupply()).to.equal(1000000);
    expect(await stockToken.balanceOf(owner.address)).to.equal(1000000);
  });

  it('Should allow owner to tokenize stock', async function () {
    await stockToken.tokenizeStock(500);
    expect(await stockToken.balanceOf(owner.address)).to.equal(1000500);
  });

  it('Should allow redemption of stock', async function () {
    await stockToken.redeemStock(500);
    expect(await stockToken.balanceOf(owner.address)).to.equal(999500);
  });

  it('Should transfer with fee', async function () {
    await stockToken.transferWithFee(addr1.address, 1000);
    expect(await stockToken.balanceOf(addr1.address)).to.equal(990);
    expect(await stockToken.balanceOf(owner.address)).to.equal(999010);
  });
});