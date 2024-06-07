# Error Handling Smart Contract

This Solidity smart contract "errorHandling" is designed to demonstrate the use of error handling statements in Solidity: require(), revert(), and assert().

## Prerequisites

Solidity compiler version: 0.8.26

## Description

This contract demonstrates different methods for error handling in Solidity, ensuring that Ether transfers are only attempted when the contract has sufficient balance, thereby preventing unintended behavior and preserving contract integrity.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., errorHandling.sol). Copy and paste the following code into the file:

```javascript
//SPDX-License-Identifier:MIT
pragma solidity 0.8.26;

//Write a smart contract that implements the require(), assert() and revert() statements.

contract errorHandling{

    uint accBalance;
    address payable user=payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);

    function getEther()public payable {}

    function checkBal()public returns (uint){
        accBalance=address(this).balance;
        return accBalance;
    }

    function testRequire(uint value)public {
        value*=10**18;
        require(accBalance>value,"Not sufficient balance in account");
        user.transfer(value);
    }

    function testRevert(uint value)public {
        value*=10**18;
        if(accBalance<value){
            revert("Not sufficient balance in account.");
        }
        user.transfer(value);
    }

    function testAssert(uint value)public {
        value*=10**18;
        assert(accBalance>=value);
        user.transfer(value);
    }
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.26" (or another compatible version), and then click on the "Compile errorHandling.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "errorHandling" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the getEther(), checkBal(), testRequire(), testRevert() and testAssert() functions. Click on the "errorHandling" contract in the left-hand sidebar, and then click on the getEther(), checkBal(), testRequire(), testRevert() and testAssert() functions.

## Explaination

### getEther Function

This function allows the contract to receive Ether. It is marked as payable, meaning it can accept Ether when it is called.

### checkBal Function

This function updates the accBalance state variable with the current balance of the contract and returns it.

The balance is obtained using address(this).balance, which gets the Ether balance of the contract.

### testRequire Function

Attempts to transfer a specified amount of Ether (converted to wei) to the user address. 

The require statement ensures the contract has sufficient balance before proceeding with the transfer.

### testRevert Function

Similar to testRequire, this function attempts to transfer a specified amount of Ether.

Instead of require, it uses an if statement with revert() to check the balance and revert the transaction with an error message if the balance is insufficient.

### testAssert Function

This function attempts to transfer Ether using assert to check the balance.

The assert statement ensures that the contract's balance is sufficient. 

If the condition fails, it throws an error and reverts the transaction.

## License

This `README.md` provides an overview of the smart contract, details its features, explains how to use the getEther(), checkBal(), testRequire(), testRevert() and testAssert() functions, and includes a section on checking balances. It also notes that the project is licensed under the MIT License.

