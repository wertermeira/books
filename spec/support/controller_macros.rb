module ControllerMacros

  def login_user
    before(:each) do
      set_password = Faker::Internet.password
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = User.create!(name: Faker::Name.name, email: Faker::Internet.email  ,password: set_password, password_confirmation: set_password, admin: true, status: true)
      sign_in user
    end
  end
end