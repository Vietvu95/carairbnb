class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :model, :make, :year, :category, :description, :price, :availability, :transmission, :colour, presence: true
end
