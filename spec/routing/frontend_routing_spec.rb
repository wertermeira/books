require "rails_helper"

RSpec.describe FrontendController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/").to route_to("frontend#index")
    end

    it "routes to #book" do
      expect(:get => "/book/1").to route_to("frontend#book", :id => "1")
    end

  end
end
