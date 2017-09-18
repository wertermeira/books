class BookSerializer < ActiveModel::Serializer
  attributes :id, :name, :image, :author, :description, :url

  def url
    "/book/#{object.id}"
  end


end
