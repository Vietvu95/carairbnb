class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :model, :make, :year, :category, :description, :price, :availability, :transmission, :colour, presence: true

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
