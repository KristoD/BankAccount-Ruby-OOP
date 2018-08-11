require 'securerandom'
class BankAccount
    @@amount_of_bank_accounts = 0
    def initialize
        generate_account_number
        @checking_account_balance = 0
        @saving_account_balance = 0
        @@amount_of_bank_accounts += 1
        @@interest_rate = 0.01
    end

    def display_checking_balance
        puts "Checkings balance: $#{@checking_account_balance}"
        return self
    end

    def display_savings_balance
        puts "Savings balance: $#{@saving_account_balance}"
        return self
    end

    def deposit amount, account
        if account == "savings"
            puts "Deposited $#{amount} into your #{account} account!"
            @saving_account_balance += amount
        elsif account == "checking"
            puts "Deposited $#{amount} into your #{account} account!"
            @checking_account_balance += amount
        else
            puts "Error: must specify which account to deposit into!"
        end
        return self
    end

    def withdraw amount, account
        if account == "savings"
            if amount > @saving_account_balance
                puts "Error: Can't withdraw more than what you have! Your savings balance is: $#{@saving_account_balance}"
            else
                puts "Withdrew $#{amount} from your #{account} account!"
                @saving_account_balance -= amount
            end
        elsif account == "checking"
            if amount > @checking_account_balance
                puts "Error: Can't withdraw more than what you have! Your checking balance is: $#{@checking_account_balance}"
            else
                puts "Withdrew $#{amount} from your #{account} account!"
                @checking_account_balance -= amount
            end
        else
            puts "Error: must specify which account to withdraw from!"
        end
        return self
    end

    def display_account_information
        display_account_number
        display_total_balance
        display_checking_balance
        display_savings_balance
        puts "Interest rate: #{@@interest_rate}"
        puts "Total bank accounts: #{@@amount_of_bank_accounts}"
        return self
    end

    def display_account_number
        puts "Account number: #{@account_number}"
        return self
    end

    def display_total_balance
        total = @checking_account_balance + @saving_account_balance
        puts "Your total balance between your checking and savings accounts is: $#{total}"
        return self
    end

    private
    def generate_account_number
        @account_number = SecureRandom.hex
    end
end

customer = BankAccount.new
# customer.display_account_number
# .deposit(1000, "savings")
# .deposit(2000, "checking")
# .display_savings_balance
# .display_checking_balance
# .withdraw(500, "savings")
# .withdraw(1750, "checking")
# .display_savings_balance
# .display_checking_balance
# .display_total_balance
# .display_account_information

customer.deposit(1000, "checking").display_checking_balance
customer2 = BankAccount.new
customer2.deposit(2000, "checking").display_checking_balance

customer.display_account_information
customer2.display_account_information