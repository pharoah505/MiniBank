pragma solidity ^0.8.0;

contract MiniBank {

    mapping(address => uint) public balances;

    address public owner;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint amountTowithdraw = balances [msg.sender];
        balances [msg.sender] = 0;
        require(amountTowithdraw > 0, "Insufficient Balance");
        payable(msg.sender).transfer(amountTowithdraw);
        

    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function checkTotalBankBalance () external view returns (uint256) {
         require(msg.sender == owner);
        return address(this).balance;
    }
}