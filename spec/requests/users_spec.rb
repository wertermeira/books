require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /admin/users" do
    it "works! (now write some real specs)" do
      set_password = Faker::Internet.password
      user = User.create!(name: Faker::Name.name, email: Faker::Internet.email  ,password: set_password, password_confirmation: set_password, admin: true, status: true)
      sign_in user
      get users_path
      expect(response).to have_http_status(200)
    end
  end
end
