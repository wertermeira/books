require 'rails_helper'

RSpec.describe "users/sessions/new", type: :view do

  it "renders sessions new not register" do
    render
    expect(rendered).not_to match /Sign up/
    expect(rendered).to match /Forgot your password?/
  end
end
