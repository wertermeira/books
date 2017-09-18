class BookSerializer < ActiveModel::Serializer
  # seriealizer books
  attributes :id, :name, :image, :author, :description, :url

  def url
    "/book/#{object.id}"
  end


end
