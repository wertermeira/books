require 'rails_helper'

RSpec.describe "books/new", type: :view do
  before(:each) do
    assign(:book, Book.new(
      :name => "MyString",
      :description => "MyText",
      :image => "MyString",
      :author => "MyString",
      :status => false,
      :deleted => false
    ))
  end

  it "renders new book form" do
    render

    assert_select "form[action=?][method=?]", books_path, "post" do

      assert_select "input[name=?]", "book[name]"

      assert_select "textarea[name=?]", "book[description]"

      assert_select "input[name=?]", "book[image]"

      assert_select "input[name=?]", "book[author]"

      assert_select "input[name=?]", "book[status]"

      assert_select "input[name=?]", "book[deleted]"
    end
  end
end
