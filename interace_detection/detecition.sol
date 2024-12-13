// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/interfaces/IERC165.sol";

interface MyInterface {
   function foo() external pure returns(uint256);
   function bar() external pure returns(bool);
}

contract CalcInterfaceId is MyInterface {

    // 直接获取接口的 interfaceId
   function getId() external pure returns(bytes4) {
     return type(MyInterface).interfaceId;
   }

   // 手动计算接口的 interfaceId
   // 接口中所有的函数选择器，进行异或操作
   function calcId() external pure returns(bytes4) {
     return bytes4(keccak256("foo()"))
       ^ bytes4(keccak256("bar()"));
   }

   // 实现 IERC165 的接口，用来判断合约是否支持 MyInterface
   function supportsInterface(bytes4 interfaceId) external pure returns(bool) {
     return interfaceId == type(MyInterface).interfaceId;
   }

   // 实现接口 MyInterface 的方法 foo
   function foo() external pure returns(uint256) {
     return 0;
   }

   // 实现接口 MyInterface 的方法 bar
   function bar() external pure returns(bool) {
     return true;
   }
}