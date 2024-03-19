json.array! @bookings do |booking|
	json.id booking.id
	json.hotel_id booking.room_bookings&.first&.room&.hotel&.id
	json.hotel_name booking.room_bookings&.first&.room&.hotel&.name
	json.check_in_date booking.check_in_date
	json.check_out_date booking.check_out_date
	json.number_of_rooms booking.room_bookings.count
	json.status booking.status
	json.booked_by booking.user.name
	json.user_id booking.user.id
end
