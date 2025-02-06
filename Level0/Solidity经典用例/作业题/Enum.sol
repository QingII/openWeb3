// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Enum {
    // Enum representing shipping status
    // 定义一个枚举类型，用于表示运输状态
    enum Status {
        Pending, // 待处理
        Shipped, // 已发货
        Accepted, // 已接受
        Rejected, // 已拒绝
        Canceled // 已取消
    }

    // Default value is the first element listed in
    // definition of the type, in this case "Pending"
    // 声明一个公共的状态变量，其类型为上面定义的枚举类型
    // 枚举类型的默认值是其定义中列出的第一个元素，在这种情况下是 "Pending"（待处理）
    Status public status;

    // Returns uint
    // Pending  - 0
    // Shipped  - 1
    // Accepted - 2
    // Rejected - 3
    // Canceled - 4
    function get() public view returns (Status) {
        return status;
    }

    // Update status by passing uint into input
    // 定义一个公共函数，用于更新运输状态
    // 函数接收一个 Status 类型的参数 _status，并将其赋值给状态变量 status
    function set(Status _status) public {
        status = _status;
    }

    // You can update to a specific enum like this
    // 定义一个公共函数，用于将运输状态更新为 "Canceled"（已取消）
    // 可以像这样直接将状态更新为特定的枚举值
    function cancel() public {
        status = Status.Canceled;
    }

    // delete resets the enum to its first value, 0
    // 定义一个公共函数，用于重置运输状态
    // 使用 delete 关键字会将枚举类型的变量重置为其第一个值，也就是 0，即 "Pending"（待处理）
    function reset() public {
        delete status;
    }
}
