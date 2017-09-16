require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
        :name => Faker::Name.name,
        :email => Faker::Internet.email,
        :password => "MyString",
        :password_confirmation => "MyString",
        :admin => false,
        :status => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
