// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract DataLocations {
    // 定义一个动态的无符号 256 位整数数组，作为状态变量存储在区块链上
    uint256[] public arr;
    // 定义一个映射，将无符号 256 位整数映射到地址类型，同样作为状态变量存储在区块链上
    mapping(uint256 => address) map;

    // 定义一个结构体，包含一个无符号 256 位整数类型的属性 foo
    struct MyStruct {
        uint256 foo;
    }

    // 定义一个映射，将无符号 256 位整数映射到 MyStruct 结构体类型，也是状态变量
    mapping(uint256 => MyStruct) myStructs;

    function f() public {
        // call _f with state variables
        // 调用内部函数 _f，并将状态变量 arr、map 以及 myStructs 映射中索引为 1 的结构体实例作为参数传递
        _f(arr, map, myStructs[1]);

        // get a struct from a mapping
        // 从 myStructs 映射中获取索引为 1 的结构体实例，并将其存储引用赋值给 storage 类型的变量 myStruct
        MyStruct storage myStruct = myStructs[1];
        // create a struct in memory
        // 在内存中创建一个 MyStruct 结构体实例，初始时 foo 属性值为 0
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(
        uint256[] storage _arr,
        mapping(uint256 => address) storage _map,
        MyStruct storage _myStruct
    ) internal {
        // do something with storage variables
        // 这里可以对传入的存储类型变量进行操作
    }

    // You can return memory variables
    function g(uint256[] memory _arr) public returns (uint256[] memory) {
        // do something with memory array
        // 可以对传入的内存数组进行一些操作
    }

    function h(uint256[] calldata _arr) external {
        // do something with calldata array
        // 可以对传入的 calldata 数组进行一些操作
    }
}
