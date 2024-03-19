import VueRouter from 'vue-router';
import Vue from 'vue';
import Hotel from './components/hotels/Index.vue';
import Booking from './components/bookings/Index.vue';

Vue.use(VueRouter);

const routes = [
  {
    path: '/',
    name: 'Hotel',
    component: Hotel
  },

{
    path: '/bookings',
    name: 'NewComponent',
    component: Booking
}
];

const router = new VueRouter({
  mode: 'history',
  routes
});

export default router;