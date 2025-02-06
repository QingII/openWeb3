// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Array {
    // Several ways to initialize an array
    // 几种初始化数组的方式
    // 声明一个动态大小的无符号 256 位整数数组，初始为空
    uint256[] public arr;
    // 声明并初始化一个动态大小的无符号 256 位整数数组，初始元素为 1、2、3
    uint256[] public arr2 = [1, 2, 3];
    // Fixed sized array, all elements initialize to 0
    // 声明一个固定大小为 10 的无符号 256 位整数数组，所有元素初始化为 0
    uint256[10] public myFixedSizeArr;

    // 定义一个视图函数，用于获取动态数组 arr 中指定索引位置的元素
    function get(uint256 i) public view returns (uint256) {
        return arr[i];
    }

    // Solidity can return the entire array.
    // Solidity 可以返回整个数组
    // But this function should be avoided for
    // 但对于长度可能无限增长的数组，应避免使用此函数
    // arrays that can grow indefinitely in length.
    // 因为返回整个数组可能会消耗大量的 gas
    function getArr() public view returns (uint256[] memory) {
        return arr;
    }

    // 定义一个公共函数，用于向动态数组 arr 末尾添加一个元素
    function push(uint256 i) public {
        // Append to array
        // 向数组末尾追加元素
        // This will increase the array length by 1.
        // 这会使数组长度增加 1
        arr.push(i);
    }

    // 定义一个公共函数，用于移除动态数组 arr 的最后一个元素
    function pop() public {
        // Remove last element from array
        // 移除数组的最后一个元素
        // This will decrease the array length by 1
        // 这会使数组长度减少 1
        arr.pop();
    }

    // 定义一个视图函数，用于获取动态数组 arr 的长度
    function getLength() public view returns (uint256) {
        return arr.length;
    }

    // 定义一个公共函数，用于删除动态数组 arr 中指定索引位置的元素
    function remove(uint256 index) public {
        // Delete does not change the array length.
        // delete 操作不会改变数组的长度
        // It resets the value at index to it's default value,
        // 它会将指定索引位置的值重置为其默认值
        // in this case 0
        // 对于无符号 256 位整数类型，默认值是 0
        delete arr[index];
    }

    // 定义一个外部函数，用于演示在内存中创建数组
    function examples() external {
        // create array in memory, only fixed size can be created
        // 在内存中创建数组，只能创建固定大小的数组
        // 这里创建了一个长度为 5 的无符号 256 位整数数组
        uint256[] memory a = new uint256[](5);
    }
}
