require 'rails_helper'

RSpec.describe FrontendController, type: :controller do
  before(:each) do
    @user = User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678", status: true )
  end
  let(:attributes) {
    {
        name: Faker::Book.title,
        description: Faker::Lorem.paragraph(2),
        author: Faker::Book.author,
        image: Faker::LoremPixel.image("200x200"),
        status: true
    }
  }

  describe "GET #index" do
    it "returns http success" do
      book = Book.create! attributes
      get :index
      expect(response).to be_success
    end
  end

  describe "GET #book" do
    it "returns http success" do
      book = Book.create! attributes
      get :book, params: {id: book.to_param}
      expect(response).to be_success
    end
  end

  describe "GET #books" do
    it "returns http success" do
      get :books
      expect(response).to have_http_status(:success)
    end
  end

end
