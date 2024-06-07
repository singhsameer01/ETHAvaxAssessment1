//SPDX-License-Identifier:Unlicensed
pragma solidity 0.8.26;

contract errorHandling{

    uint accBalance;
    address payable user=payable(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);

    function getEther()public payable {}

    function checkBal()public returns (uint){
        accBalance=address(this).balance;
        return accBalance;
    }

    function testRequire(uint value)public {
        require(accBalance>value,"Not sufficient balance in account");
        value*=10**18;
        user.transfer(value);
    }

    function testRevert(uint value)public {
        value*=10**18;
        user.transfer(value);
        if(accBalance<value){
            revert("Not sufficient balance in account.");
        }
    }

    function testAssert(uint value)public {
        value*=10**18;
        user.transfer(value);
        assert(accBalance>=value);
    }
}
