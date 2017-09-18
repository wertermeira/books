module Api
  class V1Controller < ActionController::API
    # Return all items and links
    def index
      page_number = params[:page].try(:[], :number)
      #per_page = params[:page].try(:[], :size)
      @books = Book.filed(false).order(name: :asc).page(page_number).per(12)
      render json: @books
    end
    # Find book by id
    def book
      @book = Book.filed(false).find(params[:id])
      render json: @book
    end
  end
end