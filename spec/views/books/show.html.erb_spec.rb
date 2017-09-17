require 'rails_helper'

RSpec.describe "books/show", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :name => "Name",
      :description => "MyText",
      :image => "Image",
      :author => "Author",
      :status => false,
      :deleted => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/false/)
  end
end
