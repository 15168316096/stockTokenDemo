# Ondo RWA 股票技术 Demo

这是一个简单的 demo，演示 Ondo Finance RWA（真实世界资产）中股票代币化的基本实现概念。

## RWA 背景知识
真实世界资产 (RWA) 代币化是将传统金融资产如股票、债券和基金转化为区块链上的数字代币。<mcreference link="https://www.okx.com/learn/ondo-finance-rwa-tokenization" index="2">2</mcreference> Ondo Finance 是 RWA 领域的领导者，通过区块链桥接 DeFi 和传统金融，提供机构级产品如 OUSG (代币化美国国债)。<mcreference link="https://www.gate.com/crypto-wiki/article/ondo-bridging-de-fi-and-trad-fi-utility-team-price-predictions-2025-2028" index="4">4</mcreference> 其新平台 Ondo Global Markets 旨在将股票、债券和 ETF 上链，提高可访问性和效率。<mcreference link="https://www.coindesk.com/markets/2025/02/05/ondo-finance-unveils-new-rwa-tokenization-platform-to-bring-stocks-bonds-and-etfs-onchain" index="1">1</mcreference>

Ondo 使用 Ondo Chain 等技术，确保合规和可扩展性。<mcreference link="https://ondo.finance/ondo-chain" index="3">3</mcreference> RWA 市场预计到 2030 年达数万亿美元。<mcreference link="https://www.okx.com/learn/ondo-finance-rwa-tokenization" index="2">2</mcreference>

## 概述
Ondo Finance 通过区块链技术将传统资产如股票代币化，使用 Ondo Global Markets 等平台实现。根据搜索结果，Ondo 正在推出平台来将股票、债券和 ETF 上链。<mcreference link="https://www.coindesk.com/markets/2025/02/05/ondo-finance-unveils-new-rwa-tokenization-platform-to-bring-stocks-bonds-and-etfs-onchain" index="1">1</mcreference>

## Demo 结构
- `contracts/StockToken.sol`: ERC20 合约，模拟股票代币化，包括铸币、燃烧和转账功能。
- `test/StockToken.test.js`: Hardhat 测试脚本，验证合约逻辑。

## 如何运行
1. 安装依赖: `npm install`
2. 运行测试: `npx hardhat test`
3. 部署合约: 使用 Hardhat 脚本。

更多细节见代码和测试文件。