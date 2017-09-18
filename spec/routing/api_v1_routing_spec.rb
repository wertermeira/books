require "rails_helper"

RSpec.describe Api::V1Controller, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/").to route_to("frontend#index")
    end

    it "routes to #books" do
      expect(:get => "/books").to route_to("frontend#books")
    end

    it "routes to #book" do
      expect(:get => "/book/1").to route_to("frontend#book", :id => "1")
    end

  end
end
