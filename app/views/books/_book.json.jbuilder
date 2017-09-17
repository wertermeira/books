json.extract! book, :id, :name, :description, :image, :author, :status, :deleted, :created_at, :updated_at
json.url book_url(book, format: :json)
