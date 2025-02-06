// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Base contract X
// 定义一个基合约 X
contract X {
    // 定义一个公共的字符串类型状态变量 name
    string public name;

    // 合约 X 的构造函数，接收一个字符串类型的参数 _name
    // 构造函数在合约部署时执行，用于初始化合约的状态
    constructor(string memory _name) {
        // 将传入的参数 _name 赋值给状态变量 name
        name = _name;
    }
}

// Base contract Y
// 定义一个基合约 Y
contract Y {
    // 定义一个公共的字符串类型状态变量 text
    string public text;

    // 合约 Y 的构造函数，接收一个字符串类型的参数 _text
    constructor(string memory _text) {
        // 将传入的参数 _text 赋值给状态变量 text
        text = _text;
    }
}

// There are 2 ways to initialize parent contract with parameters.
// 有两种方式可以用参数初始化父合约

// Pass the parameters here in the inheritance list.
// 方式一：在继承列表中直接传递参数
// 定义一个合约 B，它继承自合约 X 和合约 Y
// 在继承时直接为父合约 X 和 Y 的构造函数提供参数
contract B is X("Input to X"), Y("Input to Y") {

}

// Pass the parameters here in the constructor,
// similar to function modifiers.
// 方式二：在子合约的构造函数中传递参数，类似于函数修饰器的使用方式
// 定义一个合约 C，它继承自合约 X 和合约 Y
contract C is X, Y {
    // 合约 C 的构造函数，接收两个字符串类型的参数 _name 和 _text
    constructor(string memory _name, string memory _text) X(_name) Y(_text) {}
}

// Parent constructors are always called in the order of inheritance
// regardless of the order of parent contracts listed in the
// constructor of the child contract.
// 父合约的构造函数总是按照继承的顺序被调用
// 无论在子合约的构造函数中父合约的列出顺序如何

// 构造函数调用顺序：
// 1. X
// 2. Y
// 3. D
// 定义一个合约 D，它继承自合约 X 和合约 Y
contract D is X, Y {
    // 合约 D 的构造函数
    // 虽然这里看起来 Y 的参数先写，但由于继承顺序是先 X 后 Y，所以还是先调用 X 的构造函数
    constructor() X("X was called") Y("Y was called") {}
}

// 构造函数调用顺序：
// 1. X
// 2. Y
// 3. E
// 定义一个合约 E，它继承自合约 X 和合约 Y
contract E is X, Y {
    // 合约 E 的构造函数
    // 同样，尽管 Y 的参数先列出，但按照继承顺序还是先调用 X 的构造函数
    constructor() Y("Y was called") X("X was called") {}
}
