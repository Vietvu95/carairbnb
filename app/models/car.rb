class Car < ApplicationRecord
  belongs_to :user
  validates :model, :make, :year, :category, :description, :price, :availability, :transmission, :colour, presence: true
end
