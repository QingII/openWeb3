// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SimpleStorage {
    // State variable to store a number
    // 用于存储一个数字的状态变量
    uint256 public num;

    // You need to send a transaction to write to a state variable.
    // 你需要发送一笔交易来写入状态变量
    function set(uint256 _num) public {
        num = _num;
    }

    // You can read from a state variable without sending a transaction.
    // 你可以在不发送交易的情况下读取状态变量
    function get() public view returns (uint256) {
        return num;
    }
}
