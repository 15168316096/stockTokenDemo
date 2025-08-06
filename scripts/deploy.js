const hre = require('hardhat');

async function main() {
  const StockToken = await hre.ethers.getContractFactory('StockToken');
  const stockToken = await StockToken.deploy(1000000);

  await stockToken.waitForDeployment();

  console.log('StockToken deployed to:', await stockToken.getAddress());
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });