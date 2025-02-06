// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Immutable {
    // coding convention to uppercase constant variables
    // 常量变量的编码约定是使用大写字母
    address public immutable MY_ADDRESS;
    uint256 public immutable MY_UINT;

    constructor(uint256 _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}
