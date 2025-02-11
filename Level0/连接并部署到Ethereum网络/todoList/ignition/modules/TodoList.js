/*
 * @Author: huaqing
 * @Date: 2025-02-10 15:25:49
 * @LastEditors: huaqing 1098700474@qq.com
 * @LastEditTime: 2025-02-10 15:25:56
 * @Description: 
 */
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
module.exports = buildModule("TodoListModule", (m) => {
  const todoList = m.contract("TodoList", []);
  return { todoList };
});