require 'rails_helper'
RSpec.describe "books/index", type: :view do
  before(:each) do
    set_password = Faker::Internet.password
    @user = User.create!(name: Faker::Name.name, email: Faker::Internet.email  ,password: set_password, password_confirmation: set_password, admin: true, status: true)

    assign(:books, [
      Book.create!(
        :name => "Name",
        :description => "MyText123456789",
        :image => "Image",
        :author => "Author",
        :status => true,
        :user_id => @user.id
      ),
      Book.create!(
        :name => "Name",
        :description => "MyText123456789",
        :image => "Image",
        :author => "Author",
        :status => true,
        :user_id => @user.id
      )
    ])
  end

  it "renders a list of books" do

    allow(view).to receive_messages(:paginate => nil)

    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText123456789".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => "true".to_s, :count => 2
  end
end
