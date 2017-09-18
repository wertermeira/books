module Api
  class V1Controller < ActionController::API
    def index
      @books = Book.filed(false).order(name: :asc).page(params[:page]).per(12)
      render json: @books
    end

    def book
      @book = Book.filed(false).find(params[:id])
      render json: @book
    end
  end
end
