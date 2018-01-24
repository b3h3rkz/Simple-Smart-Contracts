pragma solidity ^0.4.0;

/* 
simple smart contract that returns a user's name 

*/

contract Bio {
     address owner;
     string name;
     
     
     /* 
       constructor of the contract is declared here. "msg" is a built-in object with many properties which include "sender"
       which shows what address a  contract was created from. this feature can 
       be used to implement access control
    */

      function Bio (string _name) {
         owner = msg.sender;
         name = _name;
     }
     
     // this function returns the information

     function showData () constant returns (string) {
         return name;
     }
     
     // the data to be displayed is set in this method
     function setData (string _name) {
         name = _name;
     }
}