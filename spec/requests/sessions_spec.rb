require 'rails_helper'

RSpec.describe "Sessions" do

  it "signs user in and out" do
    set_password = Faker::Internet.password
    user = User.create!(name: Faker::Name.name, email: Faker::Internet.email  ,password: set_password, password_confirmation: set_password, admin: true, status: true)


    sign_in user
    get users_path
    expect(controller.current_user).to eq(user)

    sign_out user
    get new_user_session_path
    expect(controller.current_user).to be_nil
  end

end