class Book < ApplicationRecord
  belongs_to :user
  validates :name, :description, :image, :author, presence: true
  validates :name,:author,length: {in: 3..50}
  validates :description, length: {in: 10..300}
end
