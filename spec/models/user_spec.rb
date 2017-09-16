require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create!(name: Faker::Name.name, email: Faker::Internet.email, password: "12345678", password_confirmation: "12345678", status: true )
  end

  context "creation" do
    it "check if you have been registered" do
      expect(User.count).to be 1
    end
  end
  context "columns" do
    it "has columns user" do
      col = User.column_names
      expect(col).to include('name')
      expect(col).to include('status')
      expect(col).to include('deleted')

    end
  end

  context "validate" do
    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:email)}
    it {is_expected.to validate_presence_of(:password)}
  end

end
