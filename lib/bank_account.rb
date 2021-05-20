class BankAccount

    # read and write
    attr_accessor :status, :balance
    # read-only
    attr_reader :name
    # write-only
    # attr_writer 

    def initialize name
        @name=name
        @balance=1000
        @status="open"
    end

    def deposit(amount)
        @balance += amount
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if @status == "open" && @balance > 0
            true
        else
            false
        end
    end

    def close_account
        @status="closed"
    end
end
