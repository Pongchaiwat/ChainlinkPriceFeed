// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "hardhat/console.sol";

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract ChainlinkPriceFeedConsumer {

    address chainlinkETHUSDPriceFeed = 0x8A753747A1Fa494EC906cE90E9f37563A8AF630e;

    AggregatorV3Interface priceFeed= AggregatorV3Interface(chainlinkETHUSDPriceFeed);

    int public ethPrice;

    /**
     * Network: Kovan
     * Aggregator: ETH/USD
     * Address: 0x9326BFA02ADD2366b30bacB125260Af641031331
     */
    constructor() {
        (
            /*uint80 roundID*/,
            ethPrice,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();
    }

    /**
     * Returns the latest price
     */
    function hasPriceIncreased() public view returns (bool) {
        (
            /*uint80 roundID*/,
            int currentEthPrice,
            /*uint startedAt*/,
            /*uint timeStamp*/,
            /*uint80 answeredInRound*/
        ) = priceFeed.latestRoundData();
        return currentEthPrice > ethPrice;
    }
}
