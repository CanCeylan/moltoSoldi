require 'spec_helper'

describe "friends/show" do
  before(:each) do
    @friend = assign(:friend, stub_model(Friend,
      :user_id => 1,
      :name => "Name",
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Email/)
  end
end
