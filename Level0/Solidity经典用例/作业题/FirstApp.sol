// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Counter {
    uint public count;

    function getCount() public view returns (uint) {
        return count;
    }

    function increment() public {
        count += 1;
    }

    function decrement() public {
        count -= 1;
    }
}
