require 'rails_helper'

RSpec.describe "books/index", type: :view do
  before(:each) do
    assign(:books, [
      Book.create!(
        :name => "Name",
        :description => "MyText",
        :image => "Image",
        :author => "Author",
        :status => false,
        :deleted => false
      ),
      Book.create!(
        :name => "Name",
        :description => "MyText",
        :image => "Image",
        :author => "Author",
        :status => false,
        :deleted => false
      )
    ])
  end

  it "renders a list of books" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
    assert_select "tr>td", :text => "Author".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
