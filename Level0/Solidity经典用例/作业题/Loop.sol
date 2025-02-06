// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Loop {
    function loop() public {
        // for loop
        // for 循环
        // 初始化变量 i 为 0，只要 i 小于 10 就会持续循环，每次循环结束后 i 自增 1
        for (uint256 i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip to next iteration with continue
                // 使用 continue 关键字跳过本次循环的剩余部分，直接进入下一次循环
                continue;
            }
            if (i == 5) {
                // Exit loop with break
                // 使用 break 关键字终止整个循环
                break;
            }
        }

        // while loop
        // while 循环
        uint256 j;
        // 只要 j 小于 10，就会持续执行循环体
        while (j < 10) {
            j++;
        }
    }
}
