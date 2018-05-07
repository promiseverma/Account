require 'rails_helper'

RSpec.describe "accounts/edit", type: :view do
  before(:each) do
    @account = assign(:account, Account.create!(
      :credit => "",
      :credit => "",
      :debit => "",
      :debit => ""
    ))
  end

  it "renders the edit account form" do
    render

    assert_select "form[action=?][method=?]", account_path(@account), "post" do

      assert_select "input#account_credit[name=?]", "account[credit]"

      assert_select "input#account_credit[name=?]", "account[credit]"

      assert_select "input#account_debit[name=?]", "account[debit]"

      assert_select "input#account_debit[name=?]", "account[debit]"
    end
  end
end
