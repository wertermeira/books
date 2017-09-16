require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "werter meira",
        :email => "wertermeira@gmail.com",
        :password => "123456",
        :password_confirmation => "123456",
        :admin => false,
        :status => false
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "werter meira".to_s, :count => 1
    assert_select "tr>td", :text => "wertermeira@gmail.com".to_s, :count => 1
  end
end
