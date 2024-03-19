<template>
    <div>
      <input class="form-control" placeholder="Search Hotels by location" type="text" v-model="searchQuery" @input="searchHotels"><br/><br/>
      <h2>Hotels</h2>
      <table class="table table-striped table-bordered">
        <thead>
          <tr>
            <th>Name</th>
            <th>Location</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="hotel in hotels" :key="hotel.id">
            <td>{{ hotel.name }}</td>
            <td>{{ hotel.location }}</td>
          </tr>
        </tbody>
      </table><br/>
      <div>
        <Booking />
      </div>
    </div>
</template>
  
  <script>
  import axios from 'axios'
  import Booking from '../bookings/Index.vue'


  export default {
    components: {
        Booking
    },
    data() {
      return {
        hotels: [],
        searchQuery: ''
      };
    }, 
    methods: {
        async fetchHotels() {
            try {
            const response = await axios.get('http://localhost:9000/hotels');
            const data = response.data;
            this.hotels = data;
            } catch (error) {
            console.error('Error fetching hotels:', error);
            }
        },

        async searchHotels() {
            try {
                const response = await axios.get('http://localhost:9000/hotels', {
                params: { location: this.searchQuery }
                });
                this.hotels = response.data;
            } catch (error) {
                console.error('Error searching hotels:', error);
            }
        },
    },
    mounted() {
      this.fetchHotels();
    }
  };
  </script>