// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Event {
    // Event declaration
    // Up to 3 parameters can be indexed.
    // Indexed parameters helps you filter the logs by the indexed parameter
    // 事件声明部分
    // 事件最多可以有 3 个参数被标记为 indexed
    // 被标记为 indexed 的参数可以帮助你根据这些参数来过滤日志

    // 声明一个名为 Log 的事件，包含两个参数，其中 sender 参数被标记为 indexed
    event Log(address indexed sender, string message);
    // 声明另一个名为 AnotherLog 的事件，不包含任何参数
    event AnotherLog();

    function test() public {
        // 触发 Log 事件，传递当前交易发送者的地址和 "Hello World!" 作为消息
        emit Log(msg.sender, "Hello World!");
        // 再次触发 Log 事件，传递当前交易发送者的地址和 "Hello EVM!" 作为消息
        emit Log(msg.sender, "Hello EVM!");
        // 触发 AnotherLog 事件
        emit AnotherLog();
    }
}
