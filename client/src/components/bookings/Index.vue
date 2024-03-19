<template>
    <div><br/>
      <div class="row">    
        <div class="col mb-10">
            <h2>Bookings</h2>
        </div>
        <div class="col mb-2">
            <button class="btn btn-primary btn-sm" @click="toggleComponent">Book Rooms</button>
        </div>
      </div><br/>
      
      <table class="table table-striped table-bordered">
        <thead>
          <tr>
            <th>Booking ID</th>
            <th>Hotel Name</th>
            <th>Check-in Date</th>
            <th>Check-out Date</th>
            <th>Booked By</th>
            <th>Stutus</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="booking in bookings" :key="booking.id">
            <td>{{ booking.id }}</td>
            <td>{{ booking.hotel_name }}</td>
            <td>{{ booking.check_in_date }}</td>
            <td>{{ booking.check_out_date }}</td>
            <td>{{ booking.booked_by }}</td>
            <td>{{ booking.status  }}</td>
            <td>
                <button class="btn btn-primary btn-sm" @click="buildBookingProps(booking)">Update Booking</button>
                <button class="btn btn-primary btn-sm" @click="cancelBooking(booking.id)">Cancel Booking</button>
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div v-if="showComponent">
        <div><NewBooking :booking="bookingProps" :mode="request" /></div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  import NewBooking from './New.vue'

  
  export default {
    components: {
        NewBooking
    },
    data() {
      return {
        bookings: [],
        showComponent: false,
        request: 'create',
        bookingProps: {
            id: '',
            selectedHotel: '',
            noOfRooms: '',
            checkInDate: '',
            checkOutDate: '',
            userId: ''
        }
      };
    },
    methods: {
        async fetchBookings() {
            try {
                const response = await axios.get('http://localhost:9000/bookings');
                const data = response.data;
                this.bookings = data;
            } catch (error) {
                console.error('Error fetching hotels:', error);
            }
        },

        async cancelBooking(bookingId) {
            try {
                const response = await axios.put(`http://localhost:9000/bookings/${bookingId}/cancel`);
                this.fetchBookings();
            } catch (error) {
                console.error('Error fetching hotels:', error);
            } 
        },
        async toggleComponent(booking) {

        },
        toggleComponent() {
            this.request = 'create'
            this.bookingProps.selectedHotel = '',
            this.bookingProps.noOfRooms = '',
            this.bookingProps.checkInDate = '',
            this.bookingProps.checkOutDate = '',
            this.bookingProps.userId = '',
            this.bookingProps.id = '',
            this.showComponent = !this.showComponent;
        },
        buildBookingProps(booking) {
            this.request = 'update'
            this.bookingProps.selectedHotel = booking.hotel_id,
            this.bookingProps.noOfRooms = booking.number_of_rooms,
            this.bookingProps.checkInDate = booking.check_in_date,
            this.bookingProps.checkOutDate = booking.check_out_date,
            this.bookingProps.userId = booking.user_id
            this.bookingProps.id = booking.id
            this.showComponent = !this.showComponent;
        }
    },
    mounted() {
        this.fetchBookings();
    }
  };
  </script>