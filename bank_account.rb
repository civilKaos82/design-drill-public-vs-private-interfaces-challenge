class BankAccount

  attr_reader :type, :account_number
  attr_accessor :customer_name

  def initialize(customer_name, type, account_number)
    @customer_name = customer_name
    @type = type
    @account_number = account_number
  end

  def account_number
    "****" + @account_number.to_s[4..-1]
  end

  def customer_name
    @customer_name.reverse
  end

end
