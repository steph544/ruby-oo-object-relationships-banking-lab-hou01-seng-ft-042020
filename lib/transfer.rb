require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount 

  def initialize(sender, receiver, amount)
    @sender= sender
    @receiver= receiver 
    @status= "pending"
    @amount= amount
  end 

  def valid? 
   sender.valid? && receiver.valid? == true 
 
  end 

  def execute_transaction
    if self.valid? && sender.balance > self.amount && self.status= "pending"
      sender.balance -= self.amount
      receiver.balance += self.amount 
      self.amount=0
      self.status="complete"  
    else 
      self.status= "rejected"
    "Transaction rejected. Please check your account balance."
    end 
  end

  def reverse_transfer
    if self.status= "complete" && self.valid? == true 
      sender.balance= 1000
      receiver.balance= 1000
      self.status= "reversed"
    end 
  end 
end 
