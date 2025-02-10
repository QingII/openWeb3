// SPDX-License-Identifier: MIT
// 编译器版本必须大于或等于0.8.24且小于0.9.0
pragma solidity ^0.8.24;

/**
 * @title Shipping
 * @dev 此合约用于跟踪货物的运输状态，使用枚举类型表示不同的运输状态，并提供状态更新和查询功能
 */
contract Shipping {
    // 预定义的运输状态，使用枚举类型列出
    // 运输状态包括：待处理、已发货、已送达
    enum ShippingStatus {
        Pending,
        Shipped,
        Delivered
    }

    // 私有变量，用于存储当前货物的运输状态
    ShippingStatus private status;

    // 事件，当包裹状态更新时触发，可用于外部监听和记录状态变化信息
    event LogNewAlert(string description);

    /**
     * @dev 合约构造函数，在合约部署时自动调用
     * 初始化运输状态为待处理（Pending）
     */
    constructor() {
        status = ShippingStatus.Pending;
    }

    /**
     * @dev 公共函数，用于将运输状态更新为已发货（Shipped）
     * 触发LogNewAlert事件，通知外部包裹已发货
     */
    function markShipped() public {
        status = ShippingStatus.Shipped;
        emit LogNewAlert("Your package has been shipped");
    }

    /**
     * @dev 公共函数，用于将运输状态更新为已送达（Delivered）
     * 触发LogNewAlert事件，通知外部包裹已送达
     */
    function markDelivered() public {
        status = ShippingStatus.Delivered;
        emit LogNewAlert("Your package has arrived");
    }

    /**
     * @dev 内部纯函数，用于根据传入的运输状态枚举值返回对应的字符串描述
     * @param _status 要查询的运输状态枚举值
     * @return statusText 对应的运输状态字符串描述
     */
    function getStatus(
        ShippingStatus _status
    ) internal pure returns (string memory statusText) {
        if (ShippingStatus.Pending == _status) return "Pending";
        if (ShippingStatus.Shipped == _status) return "Shipped";
        if (ShippingStatus.Delivered == _status) return "Delivered";
    }

    /**
     * @dev 公共视图函数，用于获取当前货物的运输状态字符串描述
     * @return 当前货物的运输状态字符串描述
     */
    function getCurrentStatus() public view returns (string memory) {
        return getStatus(status);
    }
}
