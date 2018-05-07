require 'rails_helper'

RSpec.describe "accounts/new", type: :view do
  before(:each) do
    assign(:account, Account.new(
      :credit => "",
      :credit => "",
      :debit => "",
      :debit => ""
    ))
  end

  it "renders new account form" do
    render

    assert_select "form[action=?][method=?]", accounts_path, "post" do

      assert_select "input#account_credit[name=?]", "account[credit]"

      assert_select "input#account_credit[name=?]", "account[credit]"

      assert_select "input#account_debit[name=?]", "account[debit]"

      assert_select "input#account_debit[name=?]", "account[debit]"
    end
  end
end
