<template>
    <div class="container mt-5">
      <h2>Hotel Booking Form</h2><br/>
      <div class="row">
        <div class="col-md-6">
          <form @submit.prevent="createOrUpdateBooking" class="needs-validation" novalidate>
            <div class="form-group">
              <label for="hotel">Select Hotel:</label>
              <select v-model="booking.selectedHotel" id="hotel" class="form-control" required>
                <option value="">Select</option>
                <option v-for="(hotel, index) in hotels" :key="index" :value="hotel.id">{{ hotel.name }}</option>
              </select>
              <div class="invalid-feedback">Please select a hotel.</div>
            </div><br/>

            <div class="form-group">
              <label for="numberOfRoom">Number of rooms</label>
              <input type="text" id="numberOfRoom" v-model="booking.noOfRooms" class="form-control" required>
              <div class="invalid-feedback">Please enter a valid check-in date.</div>
            </div><br/>
  
            <div class="form-group">
              <label for="checkInDate">Check-in Date:</label>
              <input type="date" id="checkInDate" v-model="booking.checkInDate" class="form-control" required>
              <div class="invalid-feedback">Please enter a valid check-in date.</div>
            </div><br/>
  
            <div class="form-group">
              <label for="checkOutDate">Check-out Date:</label>
              <input type="date" id="checkOutDate" v-model="booking.checkOutDate" class="form-control" required>
              <div class="invalid-feedback">Please enter a valid check-out date.</div>
            </div><br/>
  
            <div class="form-group">
              <label for="userId">Select User:</label>
              <select v-model="booking.userId" id="userId" class="form-control" required>
                <option value="">Select</option>
                <option v-for="(user, index) in users" :key="index" :value="user.id">{{ user.name }}</option>
              </select>
              <div class="invalid-feedback">Please enter a valid user ID.</div>
            </div><br/>
  
            <button type="submit" class="btn btn-primary">Book Now</button>
          </form><br/>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios'

  export default {
    props: {
        booking: {
            type: Object,
            required: true
        },
        title: {
            type: String,
            required: true
         },
        mode: 'create'
    },
    data() {
      return {
        hotels: [],
        users: [],
      };
    },
    methods: {
        async createOrUpdateBooking() {
            const bookingData = {
                booking: {
                    hotel_id: this.booking.selectedHotel,
                    number_of_rooms: this.booking.noOfRooms,
                    check_in_date: this.booking.checkInDate,
                    check_out_date: this.booking.checkOutDate,
                    status: 'booked',
                    user_id: this.booking.userId
                }
            };

            try {
                if (this.mode == 'create') {
                    const response = await axios.post('http://localhost:9000/bookings', bookingData);
                    console.log(response.data)
                } else {
                    const response = await axios.put(`http://localhost:9000/bookings/${this.booking.id}`, bookingData);
                    console.log(response.data)
                }

                this.$emit('fetchBookings');
            } catch (error) {
                console.error('Error fetching booking:', error);
            }
      },

      async fetchHotels() {
            try {
                const response = await axios.get('http://localhost:9000/hotels');
                const data = response.data;
                this.hotels = data;
            } catch (error) {
                console.error('Error fetching hotels:', error);
            }
     },

     async fetchUsers() {
            try {
                const response = await axios.get('http://localhost:9000/users');
                const data = response.data;
                this.users = data;
            } catch (error) {
                console.error('Error fetching users:', error);
            }
        },
    },
    mounted() {
      this.fetchHotels();
      this.fetchUsers();
    }
  };
  </script>