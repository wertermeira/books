class FrontendController < ApplicationController
  skip_before_action :authenticate_user!
  def index
  end

  def book
    @model = Book.find(params[:id])
  end

  def books
  end
end
