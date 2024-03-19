class Room < ApplicationRecord
  belongs_to :hotel

  has_many :bookings, through: :room_bookings
  has_many :room_bookings

  def self.available_rooms(check_in_date, check_out_date, hotel_id)
    return [] if hotel_id.blank? || check_out_date.blank? || check_in_date.blank?
    check_in_date = Date.parse(check_in_date)
    check_out_date = Date.parse(check_out_date)
    where(hotel_id: hotel_id).where.not(id: Booking.joins(:room_bookings)
                                        .where("check_in_date < ? AND check_out_date > ?", check_out_date, check_in_date)
                                        .pluck('room_bookings.room_id'))
  end
end
