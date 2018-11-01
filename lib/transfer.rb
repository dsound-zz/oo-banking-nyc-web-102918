require "pry"
require_relative "./bank_account"

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver,amount)
      @amount = amount
      @sender = sender
      @receiver = receiver
      @status = 'pending'
  end

  def valid?
      if self.sender.valid? && self.receiver.valid?
        true
      else
        false
      end
  end

  def execute_transaction
      if self.valid? && self.status == 'pending' && self.sender.balance >= self.amount
        self.receiver.balance += self.amount
        self.sender.balance -= self.amount

        self.status = 'complete'
      else
        self.status = 'rejected'
        "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if self.status == 'complete'
        self.receiver.balance -= self.amount
        self.sender.balance += self.amount

        self.status = 'reversed'
      end
    end

end

# binding.pry
#
# '1'
