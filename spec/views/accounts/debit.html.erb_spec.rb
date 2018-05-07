require 'rails_helper'

RSpec.describe "accounts/debit", type: :view do
  before(:each) do
    assign(:account, Account.new(
      :debit => 22.9
    ))
  end

  it "renders debit account form" do
    render

    assert_select "form[action=?][method=?]", save_debit_accounts_path, "post" do

      assert_select "input#account_debit[name=?]", "account[debit]"

    end
  end
end
