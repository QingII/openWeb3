// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract EtherUnits {
    uint256 public oneWei = 1 wei;
    // 1 wei is equal to 1
    // 定义一个状态变量，值为 1 wei
    bool public isOneWei = (oneWei == 1);

    // 定义一个状态变量，值为 1 gwei
    uint256 public oneGwei = 1 gwei;
    // 1 gwei is equal to 10^9 gwei
    // 1 gwei 等于 10 的 9 次方 wei
    bool public isOneGwei = (oneGwei == 1e9);

    // 定义一个状态变量，值为 1 ether
    uint256 public oneEther = 1 ether;
    // 1 ether is equal to 10^18 wei
    // 1 ether 等于 10 的 18 次方 wei
    bool public isOneEther = (oneEther == 1e18);
}
