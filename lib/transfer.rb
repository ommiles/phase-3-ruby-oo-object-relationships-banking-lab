class Transfer
  
  attr_accessor :amount, :status
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender, @receiver, @amount, @status = sender, receiver, amount, "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    # balance greater than amount
      # execute transaction and set status to complete
    # balance less than amount
      # set status to rejected
    # don't repeat transfer, by checking status
    # if @sender.balance > @amount && @status != "complete"

    if valid? && status == "pending" && sender.balance > @amount
      sender.withdraw(amount)
      receiver.deposit(amount)
      self.status="complete"
    else
      self.status="rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      receiver.withdraw(amount)
      sender.deposit(amount)
      self.status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end
