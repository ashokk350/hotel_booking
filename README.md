ruby - 2.5.8
Rails - 6.1.7.7
npm - 10.1.0

# To setup front-end in local

You can find client folder in root app directory where you can find front-end code in /client/src/components folder.

cd client
npm install
npm run dev

You have to install postgresql in your local machine.
Dependency - Postgresql

# To setup back-end in local
rails db:create
rails db:migrate
rails db:seed
rails s

# Tasks
1. I have written the logic backe-end and frontend logic to filter hotels by location but there is some issue in frontend side so this feature is not working. This can be accessed by 'http://localhost/hotels'

2. Although the booking feature on the UI is near completion, it's currently experiencing functionality issues. The main problem lies in the inability to save room bookings properly during the booking process. Despite the code being largely completed. This can be accessed by 'http://localhost/bookings'

3. Booked rooms can be displayed.

4. User can cancel the bookings.

1. you can visit http://localhost:5173/ default url once you run front-end and backend servcers.
2. I have currently created a single-page layout encompassing all tasks. Due to time constraints, each component is listed on one page. However, employing Vue Router would allow for more effective management and organization of these components. With Vue Router, we can seamlessly navigate between different pages or components, enhancing user experience and providing a more structured and intuitive interface.

3. In the first section, you can find search box to filter hotel by location followed by list of hotels.
4. In the next section, you'll encounter a 'Book Rooms' button. Clicking on this button reveals a booking form conveniently located at the bottom of the page. Here, you can input your details and submit the form.
5. Continuing forward, you'll find the booking listing page, where two additional buttons are there attention: one for updating bookings and another for canceling them. Clicking on the 'Update Booking' button will dynamically open a form at the bottom of the page, pre-filled with existing details for easy modification. Conversely, selecting the 'Cancel Booking' button promptly cancels the booking.
6. To view the latest updates on the user interface, please remember to refresh the page after creating or updating a booking


# Logical Points
1. I am checking the availability of rooms before booking using check_in_date, check_out_date, hotel_id and room_type.
2. In order to accommodate bookings with multiple rooms, I've introduced a room_booking table. This table serves the purpose of tracking all rooms associated with each booking. By implementing this structure, we can accurately record and manage bookings that involve more than one room.
3. To effectively manage booking statuses, I'm currently utilizing a simple approach, distinguishing between 'booked' and 'cancelled' statuses. However, to enhance this process, I propose utilizing enums.

