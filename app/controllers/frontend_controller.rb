class FrontendController < ApplicationController
  skip_before_action :authenticate_user!

  # Render index page and show 12 books
  def index
  end
  # Render book
  def book

  end
  # Render all books
  def books
  end
end
