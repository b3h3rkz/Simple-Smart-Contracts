pragma solidity ^0.4.0;

//sending a token from one address to another
contract Dragonstone {
    address public creator; // sender address
    mapping ( address => uint) public balances; //map address and balance
    
    //event fired after a transfer has been made
    event Delivered( address from, address to, uint amount);
    
    //constructor assigning  msg.sender to creator
    function Dragonstone () {
        creator = msg.sender;
        
    }
    
    //create the transaction, ensure that the sender's balance is greater than the amount they're sending
    function create(address receiver, uint amount) {
        if (msg.sender != creator) 
        return;
        balances[receiver] += amount;
    }
    
    //execute the transfer of the token from the sender to the receiver's address and fire an event afterwards
    function transfer(address receiver, uint amount) {
        if (balances[msg.sender] < amount) 
        return;
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        Delivered (msg.sender, receiver, amount);
        
    }
}