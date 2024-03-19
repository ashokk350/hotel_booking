class Booking < ApplicationRecord
  belongs_to :user

  has_many :rooms, through: :room_bookings
  has_many :room_bookings

  accepts_nested_attributes_for :room_bookings
end
