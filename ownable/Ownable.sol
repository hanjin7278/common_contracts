// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * 这个合约模块提供了一个基本的访问控制机制，其中有一个帐户（拥有者）可以被授予对特定函数的独占访问权。
 * 默认情况下，拥有者帐户将是部署合约的帐户。可以使用 {transferOwnership} 后来更改它。
 * 这个模块通过继承来使用。它将提供修饰符 `onlyOwner`，可以应用于您的函数，以将它们的使用限制为拥有者。
 */
abstract contract Ownable {
    //合约拥有者
    address private _owner;
    // 合约控制权转移事件
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    // 初始化合约，将合约部署者设置为拥有者
    constructor() {
        // 将合约部署者设置为初始拥有者
        _transferOwnership(msg.sender);
    }

    // 修饰符，只有合约拥有者才能调用
    modifier onlyOwner() {
        require(isOwner(), "Ownable: caller is not the owner");
        _;
    }

    // 判断返回当前是否合约拥有者
    function isOwner() public view returns (bool) {
        return msg.sender == _owner;
    }
    // 返回合约拥有者
    function getOwner() public view returns (address) {
        return _owner;
    }
  
    // 转移合约拥有者
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    //内部调用，用于设置拥有者
    function _transferOwnership(address newOwner) internal {
        // 记录当前拥有者地址
        address oldOwner = _owner;
        // 更新拥有者地址
        _owner = newOwner;
        // 触发拥有权转移事件
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}