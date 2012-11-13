require 'spec_helper'

describe "friends/new" do
  before(:each) do
    assign(:friend, stub_model(Friend,
      :user_id => 1,
      :name => "MyString",
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new friend form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => friends_path, :method => "post" do
      assert_select "input#friend_user_id", :name => "friend[user_id]"
      assert_select "input#friend_name", :name => "friend[name]"
      assert_select "input#friend_email", :name => "friend[email]"
    end
  end
end
