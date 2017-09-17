require 'rails_helper'

RSpec.describe FrontendController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #book" do
    it "returns http success" do
      get :book
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #books" do
    it "returns http success" do
      get :books
      expect(response).to have_http_status(:success)
    end
  end

end
