// SPDX-License-Identifier: MIT
// 指定编译器版本，要求大于等于0.4.22
pragma solidity >=0.4.22;

// 引入OpenZeppelin库中的ERC20合约，用于实现ERC20代币标准
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title ERC20MinerReward
 * @dev 该合约继承自ERC20合约，用于实现矿工奖励功能，可向矿工地址铸造新的代币
 */
contract ERC20MinerReward is ERC20 {
    // 定义一个事件，当奖励操作发生时触发，可用于外部监听
    // 事件包含描述信息、奖励接收地址（可索引）和当前区块编号
    event LogNewAlert(string description, address indexed _from, uint256 _n);

    /**
     * @dev 合约构造函数，在合约部署时自动调用
     * 调用父合约ERC20的构造函数，设置代币名称为 "MinerReward"，代币符号为 "MRW"
     */
    constructor() ERC20("MinerReward", "MRW") {}

    /**
     * @dev 公共函数，用于向矿工地址铸造新的代币作为奖励
     * 铸造20个代币到当前区块的矿工地址
     * 触发LogNewAlert事件，通知外部奖励操作已完成
     *
     * 注意：在实际使用中，此函数可能需要添加访问控制，以防止任意调用导致代币滥发
     */
    function reward() public {
        // 调用ERC20合约的内部函数_mint，向当前区块的矿工地址铸造20个代币
        _mint(block.coinbase, 20);
        // 触发LogNewAlert事件，记录奖励操作的描述、矿工地址和当前区块编号
        emit LogNewAlert("_rewarded", block.coinbase, block.number);
    }
}
