require "pry"
require_relative "./transfer"

class BankAccount
  attr_accessor :balance, :status
  attr_reader :name

    def initialize(name, balance = 1000)
      @name = name
      @balance = balance
      @status = 'open'
    end

    def deposit(amount)
      self.balance += amount
    end

    def display_balance
      "Your balance is $#{self.balance}."
    end

    def valid?
      if self.balance > 0 && self.status == 'open'
        true
      else
        false
      end
    end

    def close_account
      self.status = 'closed'
    end


end
