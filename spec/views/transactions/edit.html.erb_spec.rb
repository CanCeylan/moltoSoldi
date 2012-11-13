require 'spec_helper'

describe "transactions/edit" do
  before(:each) do
    @transaction = assign(:transaction, stub_model(Transaction,
      :user_id => 1,
      :friend_id => 1,
      :amount => 1,
      :type => 1
    ))
  end

  it "renders the edit transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => transactions_path(@transaction), :method => "post" do
      assert_select "input#transaction_user_id", :name => "transaction[user_id]"
      assert_select "input#transaction_friend_id", :name => "transaction[friend_id]"
      assert_select "input#transaction_amount", :name => "transaction[amount]"
      assert_select "input#transaction_type", :name => "transaction[type]"
    end
  end
end
