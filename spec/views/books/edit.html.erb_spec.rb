require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    set_password = Faker::Internet.password
    @user = User.create!(name: Faker::Name.name, email: Faker::Internet.email  ,password: set_password, password_confirmation: set_password, admin: true, status: true)
    @book = assign(:book, Book.create!(
        name: Faker::Book.title,
        description: Faker::Lorem.paragraph(2),
        author: Faker::Book.author,
        image: Faker::LoremPixel.image("200x200"),
        status: true,
        user_id: @user.id
    ))
  end

  it "renders the edit book form" do
    render

      assert_select "form[action=?][method=?]", book_path(@book), "post" do

      assert_select "input[name=?]", "book[name]"

      assert_select "textarea[name=?]", "book[description]"

      assert_select "input[name=?]", "book[image]"

      assert_select "input[name=?]", "book[author]"

      assert_select "input[name=?]", "book[status]"
    end
  end
end
