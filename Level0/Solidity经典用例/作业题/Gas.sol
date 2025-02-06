// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Gas {
    // 定义一个公共的状态变量 i，初始值为 0
    uint256 public i = 0;

    // Using up all of the gas that you send causes your transaction to fail.
    // 如果你发送的所有Gas都被耗尽，会导致你的交易失败。
    // State changes are undone.
    // 状态变更会被撤销。
    // Gas spent are not refunded.
    // 已消耗的Gas不会被退还。
    function forever() public {
        // Here we run a loop until all of the gas are spent
        // 在这里，我们运行一个无限循环，直到所有的Gas都被耗尽
        // and the transaction fails
        // 然后交易失败
        while (true) {
            i += 1;
        }
    }
}
