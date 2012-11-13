require 'spec_helper'

describe "friends/edit" do
  before(:each) do
    @friend = assign(:friend, stub_model(Friend,
      :user_id => 1,
      :name => "MyString",
      :email => "MyString"
    ))
  end

  it "renders the edit friend form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => friends_path(@friend), :method => "post" do
      assert_select "input#friend_user_id", :name => "friend[user_id]"
      assert_select "input#friend_name", :name => "friend[name]"
      assert_select "input#friend_email", :name => "friend[email]"
    end
  end
end
