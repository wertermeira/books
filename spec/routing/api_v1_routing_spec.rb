require "rails_helper"

RSpec.describe Api::V1Controller, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/api/v1/index").to route_to("api/v1#index")
    end

    it "routes to #book" do
      expect(:get => "api/v1/book/1").to route_to("api/v1#book", :id => "1")
    end

  end
end
