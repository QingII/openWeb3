// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Error {
    function testRequire(uint256 _i) public pure {
        // Require should be used to validate conditions such as:
        // - inputs
        // - conditions before execution
        // - return values from calls to other functions
        // require 语句通常用于验证各种条件，例如：
        // - 函数的输入参数
        // - 执行操作前需要满足的条件
        // - 调用其他函数返回的值是否符合预期
        // 如果 _i 不大于 10，交易将被回滚，并抛出错误信息 "Input must be greater than 10"
        require(_i > 10, "Input must be greater than 10");
    }

    function testRevert(uint256 _i) public pure {
        // Revert is useful when the condition to check is complex.
        // This code does the exact same thing as the example above
        // revert 语句在需要检查的条件比较复杂时很有用
        // 此代码实现的功能与上面的 testRequire 函数完全相同
        // 如果 _i 小于等于 10，交易将被回滚，并抛出错误信息 "Input must be greater than 10"
        if (_i <= 10) {
            revert("Input must be greater than 10");
        }
    }

    uint256 public num;

    function testAssert() public view {
        // Assert should only be used to test for internal errors,
        // and to check invariants.
        // assert 语句仅用于检测内部错误以及检查不变量

        // Here we assert that num is always equal to 0
        // since it is impossible to update the value of num
        // 这里我们断言 num 始终等于 0，因为在当前代码逻辑下 num 没有被更新的可能
        // 如果 num 不等于 0，会触发严重的内部错误，合约可能进入异常状态
        assert(num == 0);
    }

    // custom error
    // 定义一个自定义错误类型，名为 InsufficientBalance
    // 该错误携带两个参数：balance（当前余额）和 withdrawAmount（要提取的金额）
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    // 定义一个视图函数，用于测试自定义错误
    function testCustomError(uint256 _withdrawAmount) public view {
        // 获取当前合约的余额
        uint256 bal = address(this).balance;
        // 如果合约余额小于要提取的金额
        if (bal < _withdrawAmount) {
            // 抛出自定义错误 InsufficientBalance，并传递当前余额和要提取的金额作为参数
            revert InsufficientBalance({
                balance: bal,
                withdrawAmount: _withdrawAmount
            });
        }
    }
}
