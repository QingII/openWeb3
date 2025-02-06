// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Variables {
    // State variables are stored on the blockchain.
    // 状态变量会存储在区块链上。
    uint256 public num = 123;

    function doSomething() public {
        // Local variables are not saved to the blockchain.
        // 局部变量不会保存到区块链上。
        uint256 i = 456;

        // Here are some global variables
        // 以下是一些全局变量
        // Current block timestamp
        // 当前区块的时间戳
        uint256 timestamp = block.timestamp;
        // address of the caller
        // 调用者的地址
        address sender = msg.sender;
    }
}
