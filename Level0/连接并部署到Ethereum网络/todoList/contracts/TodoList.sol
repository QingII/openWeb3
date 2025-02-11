// SPDX-License-Identifier: MIT
// 指定编译器版本，要求大于等于0.4.22且小于0.9.0
pragma solidity >=0.4.22 <0.9.0;

/**
 * @title TodoList
 * @dev 该合约实现了一个简单的待办事项列表功能，允许用户创建待办任务并切换任务状态
 */
contract TodoList {
    // 公共变量，用于记录待办任务的总数
    uint public taskCount = 0;

    // 定义一个结构体 Task，用于表示待办任务
    // 包含任务的 ID、任务名称和任务状态
    struct Task {
        uint id;
        string taskname;
        bool status;
    }

    // 映射，将任务 ID 映射到对应的 Task 结构体
    // 可以通过任务 ID 快速查找和访问任务信息
    mapping(uint => Task) public tasks;

    // 事件，当创建新任务时触发
    // 可用于外部监听和记录新任务的创建信息
    event TaskCreated(uint id, string taskname, bool status);

    // 事件，当任务状态改变时触发
    // 可用于外部监听和记录任务状态的更新信息
    event TaskStatus(uint id, bool status);

    /**
     * @dev 合约构造函数，在合约部署时自动调用
     * 初始化时创建一个默认的待办任务
     */
    constructor() {
        createTask("Todo List Tutorial");
    }

    /**
     * @dev 公共函数，用于创建新的待办任务
     * @param _taskname 新任务的名称
     */
    function createTask(string memory _taskname) public {
        // 任务总数加 1
        taskCount++;
        // 创建新的任务并存储到映射中
        tasks[taskCount] = Task(taskCount, _taskname, false);
        // 触发 TaskCreated 事件，通知外部新任务已创建
        emit TaskCreated(taskCount, _taskname, false);
    }

    /**
     * @dev 公共函数，用于切换指定任务的状态
     * @param _id 要切换状态的任务 ID
     */
    function toggleStatus(uint _id) public {
        // 从映射中获取指定 ID 的任务信息
        Task storage _task = tasks[_id];
        // 切换任务状态
        _task.status = !_task.status;
        // 更新映射中的任务信息
        tasks[_id] = _task;
        // 触发 TaskStatus 事件，通知外部任务状态已更新
        emit TaskStatus(_id, _task.status);
    }
}
