/*
 * @Author: huaqing
 * @Date: 2025-02-10 13:27:00
 * @LastEditors: huaqing 1098700474@qq.com
 * @LastEditTime: 2025-02-10 13:29:24
 * @Description: 
 */
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
module.exports = buildModule("ShippingModule", (m) => {
  const shipping = m.contract("Shipping", []);
  m.call(shipping, "getCurrentStatus", []);
  return { shipping };
}); 