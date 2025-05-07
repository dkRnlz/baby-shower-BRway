<template>
  <div class="fixed inset-0 bg-pink-50 flex items-center justify-center p-4 sm:p-6">
    <div class="w-full max-w-md mx-auto bg-white rounded-xl shadow-lg p-6 sm:p-8 space-y-6">
      <!-- Cabeçalho com ícone e título -->
      <div class="flex flex-col items-center">
        <svg xmlns="http://www.w3.org/2000/svg"
             class="w-12 h-12 text-pink-500 mb-2"
             fill="none" viewBox="0 0 24 24"
             stroke="currentColor" stroke-width="2">
          <path stroke-linecap="round" stroke-linejoin="round"
                d="M12 4.5c-4.142 0-7.5 3.358-7.5 7.5S7.858 19.5 12 19.5 19.5 16.142 19.5 12 16.142 4.5 12 4.5z
                   M12 2.25a9.75 9.75 0 100 19.5 9.75 9.75 0 000-19.5z
                   M12 8.25a1.5 1.5 0 11.001 3.001A1.5 1.5 0 0112 8.25zm0 6.75
                   c-2.485 0-4.5 1.567-4.5 3.5h9
                   c0-1.933-2.015-3.5-4.5-3.5z" />
        </svg>
        <h1 class="text-xl sm:text-2xl font-extrabold text-pink-600 text-center">
          Chá de Fraldas da Luiza
        </h1>
        <p class="mt-1 text-gray-600 text-sm text-center">
          Por favor, confirme sua presença preenchendo o formulário abaixo
        </p>
      </div>

      <!-- Formulário -->
      <form @submit.prevent="submit" class="space-y-4">
        <div>
          <label class="block text-sm font-medium text-gray-700">Nome</label>
          <input
            v-model="form.name"
            type="text"
            placeholder="Seu nome completo"
            required
            class="mt-1 block w-full border border-gray-300 rounded-md px-3 py-2
                   focus:outline-none focus:ring-pink-500 focus:border-pink-500 text-sm sm:text-base"
          />
        </div>
        <div>
          <label class="block text-sm font-medium text-gray-700">Telefone</label>
          <input
            v-model="form.phone"
            @input="formatPhone"
            type="tel"
            placeholder="(00) 00000-0000"
            required
            inputmode="numeric"
            pattern="\(\d{2}\) \d{5}-\d{4}"
            maxlength="15"
            class="mt-1 block w-full border border-gray-300 rounded-md px-3 py-2
                 focus:outline-none focus:ring-pink-500 focus:border-pink-500 text-sm sm:text-base"
          />
        </div>
        <div>
          <label class="block text-sm font-medium text-gray-700">Quem você irá trazer?</label>
          <div v-for="(guest, index) in form.guests" :key="index" class="mt-1">
            <div class="flex space-x-2">
              <input
                v-model="guest.name"
                type="text"
                placeholder="Nome do acompanhante"
                required
                class="flex-1 block w-full border border-gray-300 rounded-md px-3 py-2
                       focus:outline-none focus:ring-pink-500 focus:border-pink-500 text-sm sm:text-base"
              />
              <button
                type="button"
                @click="removeGuest(index)"
                class="px-3 py-2 bg-pink-50 hover:bg-pink-100 text-pink-600 rounded-full
                       text-sm sm:text-base"
              >–</button>
            </div>
          </div>
          <button
            type="button"
            @click="addGuest"
            class="mt-4 inline-flex items-center text-pink-600 bg-pink-50 hover:bg-pink-100 
                  px-4 py-2 rounded-md text-sm sm:text-base font-medium transition w-full justify-center"
          >
            + Adicionar acompanhante
          </button>
        </div>
        <button
          type="submit"
          class="w-full flex items-center justify-center space-x-2 py-2 px-4
                 bg-pink-500 hover:bg-pink-600 text-white font-semibold rounded-md shadow
                 text-sm sm:text-base"
        >
          <span>Confirmar Presença</span>
          <svg xmlns="http://www.w3.org/2000/svg"
               class="w-5 h-5"
               fill="none" viewBox="0 0 24 24"
               stroke="currentColor" stroke-width="2">
            <path stroke-linecap="round" stroke-linejoin="round"
                  d="M5 13l4 4L19 7" />
          </svg>
        </button>
      </form>

      <p class="text-center text-gray-500 text-xs mt-4">
        Com carinho ♡ Família da Luiza
      </p>

      <!-- Popup de agradecimento -->
      <!-- Altere a seção do modal para: -->
<div v-if="showModal" class="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-6">
  <div class="max-w-md w-full bg-white rounded-xl shadow-lg p-8 space-y-6 mx-auto">
    <p class="text-gray-800 text-center">
      Hey!!<br><br>
      Obrigado por confirmar presença.<br><br>
      Afinal, quem vai nos ensinar a rir das trocas de fralda em câmera lenta? 😉<br>
      Preciso de fraldas no tamanho M e G e também preciso do seu melhor abraço.<br>
      Prometo só chorar por emoção! 💖🍼<br><br>
      Temos freezer, então traga sua bebida e sim pode ser alcóolica também<br>
      Não esquece do seu kit churrasco!<br>
    </p>
    <p class="text-gray-800 text-center">
      O endereço fica na Av. Monsenhor Eduardo, 2394 - Pres. Roosevelt<br>
      Esperamos vocês a partir das 12h!<br>
      Clica 
      <a href="https://maps.app.goo.gl/p8AahtgQkbYQjLYS7?g_st=aw" 
         target="_blank" 
         class="text-pink-600 font-semibold hover:underline">
         AQUI
      </a>
      que irá levar direto pro Google Maps 🙂
    </p>
    <button 
      @click="showModal = false" 
      class="mt-4 w-full py-2 bg-pink-500 hover:bg-pink-600 text-white font-semibold rounded-md shadow">
      Fechar
    </button>
  </div>
</div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  name: 'RsvpForm',
  data() {
    return {
      form: { name: '', phone: '', guests: [{ name: '' }] },
      status: '',
      showModal: false
    };
  },
  methods: {
    formatPhone(e) {
      let digits = e.target.value.replace(/\D/g, '').slice(0, 11);
      const part1 = digits.slice(0, 2);
      const part2 = digits.slice(2, 7);
      const part3 = digits.slice(7, 11);
      e.target.value = `(${part1}` + (part2 ? `) ${part2}` : '') + (part3 ? `-${part3}` : '');
      this.form.phone = e.target.value;
    },
    addGuest() {
      this.form.guests.push({ name: '' });
    },
    removeGuest(index) {
      this.form.guests.splice(index, 1);
    },
    async submit() {
      try {
        const payload = {
          rsvp: {
            name: this.form.name,
            phone: this.form.phone,
            guests_attributes: this.form.guests
          }
        };
        await axios.post('/rsvps', payload);
        this.showModal = true;
        this.form = { name: '', phone: '', guests: [{ name: '' }] };
      } catch (e) {
        this.status = 'Erro: ' + (e.response?.data?.errors?.join(', ') || e.message);
      }
    },
    closeModal() {
      this.showModal = false;
    }
  }
};
</script>