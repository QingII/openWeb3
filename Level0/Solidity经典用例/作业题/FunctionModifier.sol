// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract FunctionModifier {
    // We will use these variables to demonstrate how to use
    // modifiers.

    // 存储合约的所有者地址
    address public owner;
    // 一个公共的无符号 256 位整数变量，初始值为 10
    uint256 public x = 10;
    // 一个布尔类型的变量，用于标记合约是否处于锁定状态
    bool public locked;

    // 合约的构造函数，在合约部署时执行
    constructor() {
        // Set the transaction sender as the owner of the contract.
        // 将部署合约的交易发送者地址设置为合约的所有者
        owner = msg.sender;
    }

    // Modifier to check that the caller is the owner of
    // the contract.
    // 定义一个函数修饰器 onlyOwner
    // 用于检查调用函数的是否为合约的所有者
    modifier onlyOwner() {
        // 检查调用者的地址是否等于合约所有者的地址
        // 如果不相等，抛出错误信息 "Not owner"
        require(msg.sender == owner, "Not owner");
        // Underscore is a special character only used inside
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        // 下划线 _ 是一个特殊字符，仅用于函数修饰器内部
        // 它告诉 Solidity 继续执行被修饰函数的剩余代码
        _;
    }

    // Modifiers can take inputs. This modifier checks that the
    // address passed in is not the zero address.
    // 定义一个带参数的函数修饰器 validAddress
    // 用于检查传入的地址是否为有效的非零地址
    modifier validAddress(address _addr) {
        // 检查传入的地址是否不等于零地址
        // 如果等于零地址，抛出错误信息 "Not valid address"
        require(_addr != address(0), "Not valid address");
        _;
    }

    // 定义一个公共函数 changeOwner，用于更改合约的所有者
    // 该函数使用了 onlyOwner 和 validAddress 修饰器
    function changeOwner(
        address _newOwner
    ) public onlyOwner validAddress(_newOwner) {
        // 将合约的所有者地址更新为传入的新地址
        owner = _newOwner;
    }

    // Modifiers can be called before and / or after a function.
    // This modifier prevents a function from being called while
    // it is still executing.
    // 定义一个函数修饰器 noReentrancy
    // 用于防止函数在执行过程中被再次调用（重入攻击保护）
    modifier noReentrancy() {
        // 检查合约是否处于未锁定状态
        // 如果已锁定，抛出错误信息 "No reentrancy"
        require(!locked, "No reentrancy");

        // 将合约标记为锁定状态
        locked = true;
        _;
        // 函数执行完毕后，将合约标记为未锁定状态
        locked = false;
    }

    // 定义一个公共函数 decrement，用于递减变量 x 的值
    // 该函数使用了 noReentrancy 修饰器
    function decrement(uint256 i) public noReentrancy {
        // 将变量 x 的值减去 i
        x -= i;

        // 如果 i 大于 1，递归调用 decrement 函数，传入 i - 1 作为参数
        if (i > 1) {
            decrement(i - 1);
        }
    }
}
