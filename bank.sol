pragma solidity ^0.8.0;

contract bank{

    address payable public owner;
     
    mapping(address => uint) public balance;
    mapping(address => bool) public register;

    constructor() payable{
       owner = payable(msg.sender);
    }

      struct Account {
        uint256 accountId;
        address userAddress;
        uint256 balance;
        string name;
        uint256 transactions;
    
    
    }

  modifier isRegister() {
        require(register[msg.sender] == true, "Not isRegister");
        _;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You Are Not The owner");
        _;
    }

      modifier enoughBalance(uint amount) {
        require(balance[msg.sender] >= amount, "You do not have enough balance");
        _;
    }
function Register() public{
    require(register[msg.sender]==false, "already register");
    register[msg.sender]=true;
    // create account
        Account memory acc = Account({
            accountId: accountCounter,
            userAddress: msg.sender,
            balance: 0,
            name: name,
            transactions: 0
        });
        Account[msg.sender] = acc;
        accountCounter++;

}
    function withdrawMoney(uint amount ) public isRegister enoughBalance(amount){
      balance[msg.sender] -= amount;
      payable(msg.sender).transfer(amount);
    }

    function deposite() public payable isRegister {
       balance[msg.sender]+=msg.value;
  }

  function getBalance() public view returns (uint){
       return address(this).balance;
   }

   
     
    }

 



