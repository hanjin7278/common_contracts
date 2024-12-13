# 常用合约
## 1、权限控制合约 Ownable
智能合约通常也有权限控制功能，有些功能可以提供给任何人使用，而有些功能只能由管理员，也就是合约拥有者使用。
在智能合约中，通过对于调用者地址的判断，来决定调用者是否有权利使用。它的实现通常有两种方法：使用 if 语句判断，或者使用 require 判断。
其实，Openzepplin 库中专门实现了这样的一个通用的抽象合约，名称为 Ownable，我们可以直接拿来使用。

## 2、ERC165合约、接口检测 detecition
ERC-165 是一个以太坊智能合约的标准，它提供了一种机制来检测某个合约是否支持特定的接口。
ERC-165 标准使用比较广泛。比如：MetaMask 钱包如何判断某个地址是 ERC-721 合约，还是 ERC-20  合约呢？
通常，钱包就会按照 ERC-165 标准的要求，对合约地址进行检测，来确定它到底符合哪种标准。
ERC-165 标准非常简单，它只要求实现一个 supportsInterface 函数。该函数接收一个接口标识符 interfaceId 作为参数，并返回一个布尔值，指示合约是否支持该 interfaceId 所代表的接口。以下 ERC-165 标准接口定义：
```
interface IERC165 {
  function supportsInterface(bytes4 interfaceId) external view returns (bool);
}
```