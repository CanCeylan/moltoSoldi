require 'spec_helper'

describe "friends/index" do
  before(:each) do
    assign(:friends, [
      stub_model(Friend,
        :user_id => 1,
        :name => "Name",
        :email => "Email"
      ),
      stub_model(Friend,
        :user_id => 1,
        :name => "Name",
        :email => "Email"
      )
    ])
  end

  it "renders a list of friends" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
