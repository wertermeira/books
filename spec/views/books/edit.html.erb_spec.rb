require 'rails_helper'

RSpec.describe "books/edit", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :name => "MyString",
      :description => "MyText",
      :image => "MyString",
      :author => "MyString",
      :status => false,
      :deleted => false
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

      assert_select "input[name=?]", "book[deleted]"
    end
  end
end
