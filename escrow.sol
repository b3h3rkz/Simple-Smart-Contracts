pragma solidity ^0.4.0;

contract Escrow {
    
    address public buyer;
    address public seller;
    address public arbiter;
    
    enum State {AWAITING_PAYMENT, AWAITING_DELIVERY, REFUNDED, COMPLETED }
    State public  currentState;
    
    
    modifier isBuyer () {
        require(msg.sender == buyer);
        _;
    }

    modifier isSeller () {
        require(msg.sender == seller);
        _;
    }
    
    modifier isArbiter () {
        require(msg.sender == arbiter);
        _;
    }
    
    modifier isState(State _state){
        require(currentState == _state);
        _;
    }
    
    function Escrow (address _buyer, address _seller, address _arbiter){
        buyer = _buyer;
        seller = _seller;
        arbiter =  _arbiter;
    }
    
    function sendPayment() isBuyer isState(State.AWAITING_PAYMENT) payable {
         currentState = State.AWAITING_DELIVERY;
    }
    
    function confirmItemDelivery () isSeller isState (State.AWAITING_DELIVERY) {
        currentState = State.COMPLETED;
        seller.send(this.balance);
    }
    
    function refundPayment () isArbiter isState(State.AWAITING_DELIVERY){
        currentState = State.REFUNDED;
        buyer.send(this.balance);
    }
    
}