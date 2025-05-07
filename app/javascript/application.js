// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import { createApp } from 'vue'
import RsvpForm from '../components/RsvpForm.vue'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.getElementById('rsvp-form')
  if (el) createApp(RsvpForm).mount(el)
})
