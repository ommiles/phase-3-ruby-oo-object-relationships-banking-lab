class Transfer
  
  attr_accessor :amount, :status
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status="pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid?
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

    if valid? && @status == "pending" && @sender.balance > @amount
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
      @status="complete"
    else
      @status="rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
end
