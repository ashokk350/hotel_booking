<script setup>
import Hotel from './components/hotels/Index.vue'
</script>

<template>
  <div class="container">
    <div>
      <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-primary">
        <a class="navbar-brand" href="#">Hotel Booking</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
      </nav>
    </div><br/>
    <Hotel />
  </div>
</template>
