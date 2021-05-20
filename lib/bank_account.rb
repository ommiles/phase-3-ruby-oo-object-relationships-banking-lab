class BankAccount

    # read and write
    attr_accessor :status, :balance
    # read-only
    attr_reader :name
    # write-only
    # attr_writer 

    def initialize name
        @name, @balance, @status = name, 1000, "open"
    end

    def deposit(amount)
        self.balance += amount
    end

    def withdraw(amount)
        self.balance -= amount
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
