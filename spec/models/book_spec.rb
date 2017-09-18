require 'rails_helper'

RSpec.describe Book, type: :model do
  before(:each) do
    @user = User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678", status: true )
    Book.create!(name: Faker::Book.title, description: Faker::Lorem.paragraph(2),image: Faker::LoremPixel.image("200x200"), status: true, author: Faker::Book.author, user_id: @user.id)
  end

  it {is_expected.to belong_to(:user)}

  context "creation" do
    it "check if you have been registered" do
      expect(Book.count).to be 1
    end
  end

  context "columns" do
    it "has columns books" do
      col = Book.column_names
      expect(col).to include('name')
      expect(col).to include('description')
      expect(col).to include('image')
      expect(col).to include('status')
      expect(col).to include('deleted')
      expect(col).to include('author')

    end
  end

  context "validate" do


    context "name" do
      it {is_expected.to validate_presence_of(:name)}
      it {is_expected.to validate_length_of(:name).is_at_least(3)}
      it {is_expected.to validate_length_of(:name).is_at_most(50)}
    end

    context "description" do
      it {is_expected.to validate_presence_of(:description)}
      it {is_expected.to validate_length_of(:description).is_at_least(10)}
      it {is_expected.to validate_length_of(:description).is_at_most(300)}
    end

    context "author" do
      it {is_expected.to validate_presence_of(:author)}
      it {is_expected.to validate_length_of(:author).is_at_least(3)}
      it {is_expected.to validate_length_of(:author).is_at_most(50)}
    end

    context "image" do
      it {is_expected.to validate_presence_of(:image)}
    end

  end
end
