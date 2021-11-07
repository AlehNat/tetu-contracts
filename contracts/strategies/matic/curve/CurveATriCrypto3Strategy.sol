// SPDX-License-Identifier: ISC
/**
* By using this software, you understand, acknowledge and accept that Tetu
* and/or the underlying software are provided “as is” and “as available”
* basis and without warranties or representations of any kind either expressed
* or implied. Any use of this open source software released under the ISC
* Internet Systems Consortium license is done at your own risk to the fullest
* extent permissible pursuant to applicable law any and all liability as well
* as all warranties, including any fitness for a particular purpose with respect
* to Tetu and/or the underlying software and the use thereof are disclaimed.
*/
pragma solidity 0.8.4;

import "../../../base/strategies/curve/CurveStrategy.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "../../../third_party/curve/IGauge.sol";
import "../../../base/strategies/StrategyBase.sol";


/// @title Contract for Curve atricrypto3 strategy implementation
/// @author belbix
contract CurveATriCrypto3Strategy is CurveStrategy {
  using SafeERC20 for IERC20;

  /// rewards
  address private constant WMATIC = address(0x0d500B1d8E8eF31E21C99d1Db9A6444d3ADf1270);
  address private constant CRV = address(0x172370d5Cd63279eFa6d502DAB29171933a610AF);

  address[] private poolRewards = [WMATIC, CRV];

  /// deposit tokens
  address private constant DAI = address(0x8f3Cf7ad23Cd3CaDbD9735AFf958023239c6A063);
  address private constant USDC = address(0x2791Bca1f2de4661ED88A30C99A7a9449Aa84174);
  address private constant USDT = address(0xc2132D05D31c914a87C6611C10748AEb04B58e8F);
  address private constant WBTC = address(0x1BFD67037B42Cf73acF2047067bd4F2C47D9BfD6);
  address private constant WETH = address(0x7ceB23fD6bC0adD59E62ac25578270cFf1b9f619);

  /// @notice Curve gauge rewards pool
  address private constant _GAUGE = address(0x1d8b86e3D88cDb2d34688e87E72F388Cb541B7C8);

  address[] private _assets = [DAI, USDC, USDT, WBTC, WETH];

  /// @notice Contract constructor using on strategy implementation
  /// @dev The implementation should check each parameter
  /// @param _controller Controller address
  /// @param _underlying Underlying token address
  /// @param _vault SmartVault address that will provide liquidity
  constructor(
    address _controller,
    address _underlying,
    address _vault
  ) CurveStrategy(_controller, _underlying, _vault, poolRewards, _GAUGE, USDC, 3) {}

  /// assets should reflect underlying tokens need to investing
  function assets() external override view returns (address[] memory) {
    return _assets;
  }

}
