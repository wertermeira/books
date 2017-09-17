require 'rails_helper'

RSpec.describe "books/show", type: :view do
  before(:each) do
    @book = assign(:book, Book.create!(
      :name => "Name",
      :description => "MyText12345567",
      :image => "Image",
      :author => "Author"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText12345567/)
    expect(rendered).to match(/Image/)
    expect(rendered).to match(/Author/)
    expect(rendered).to match(/Back/)
    expect(rendered).to match(/Edit/)
  end
end
