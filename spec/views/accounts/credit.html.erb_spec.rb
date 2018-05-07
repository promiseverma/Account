require 'rails_helper'

RSpec.describe "accounts/credit", type: :view do
  before(:each) do
    assign(:account, Account.new(
      :credit => 22.9
    ))
  end

  it "renders credit account form" do
    render

    assert_select "form[action=?][method=?]", save_credit_accounts_path, "post" do

      assert_select "input#account_credit[name=?]", "account[credit]"

    end
  end
end
