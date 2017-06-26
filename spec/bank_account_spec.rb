require_relative '../bank_account'

describe BankAccount do

  let(:bank_account) {BankAccount.new("John Smith", "checking", 1234567)}

  it "has a readable customer name, type and account number" do
      expect(bank_account.customer_name).to eq("John Smith")
      expect(bank_account.type).to eq("checking")
      expect(bank_account.account_number).to eq(1234567)
  end

  it "has a writable customer name" do
    expect {bank_account.customer_name = "Jane Doe"}.to change {bank_account.customer_name}.to "Jane Doe"
  end

  it "has a non-writeable type and account number" do
    expect {bank_account.type = "savings"}.to raise_error(NoMethodError)
    expect {bank_account.account_number = 123}.to raise_error(NoMethodError)
  end

  # it "encrypts the account number and customer name" do
  #   expect(bank_account.account_number).to eq("****567")
  #   expect(bank_account.customer_name).to eq("htimS nhoJ")
  # end
end
