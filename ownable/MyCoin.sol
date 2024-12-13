// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "Ownable/Ownable.sol";

contract MyCoin is Ownable {
    
    // 设置账户进入黑名单字典
    mapping (address => bool) blackList;
    
    //调用Ownable中的构造方法设置所有权人地址
    constructor() Ownable(){}

    // 设置账户进入黑名单
    function setBlackList(address _addr,bool flag) public onlyOwner {
        // 设置账户在黑名单中的状态为 flag
        blackList[_addr] = flag;
    }

    // 查询账户是否在黑名单中
    function isBlackListed(address _addr) public view returns (bool) {
        return blackList[_addr];
    }
}