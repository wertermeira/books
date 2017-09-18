class Book < ApplicationRecord
  # Reference a user
  belongs_to :user, optional: true

  #validations name, description, :image, author
  validates :name, :description, :image, :author, presence: true
  validates :name,:author,length: {in: 3..50}
  validates :description, length: {in: 10..300}
end
