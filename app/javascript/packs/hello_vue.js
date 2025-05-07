import axios from 'axios'
import RsvpForm from '../components/RsvpForm.vue'
import { createApp } from 'vue'

const tokenMeta = document.querySelector('meta[name="csrf-token"]')
if (tokenMeta) {
  axios.defaults.headers.common['X-CSRF-Token'] = tokenMeta.content
}

createApp(RsvpForm).mount('#rsvp-form')
