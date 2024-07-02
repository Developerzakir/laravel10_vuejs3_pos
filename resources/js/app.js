import { createRouter, createWebHistory} from 'vue-router'

import './bootstrap';
import { createApp } from 'vue';




//Import Routes 
import routes from './routes';

//Import User class
import User from './Helpers/User';
window.User = User

//Sweetalert2 import
import Swal from 'sweetalert2'
window.Swal = Swal;

const Toast = Swal.mixin({
    toast: true,
    position: "top-end",
    showConfirmButton: false,
    timer: 3000,
    timerProgressBar: true,
    didOpen: (toast) => {
      toast.onmouseenter = Swal.stopTimer;
      toast.onmouseleave = Swal.resumeTimer;
    }
  });
  window.Toast = Toast;
  

 




const router = createRouter({
    history: createWebHistory(),
    routes,
});

const app = createApp({});
app.use(router)
app.mount('#app')


 // window.Reload = new Vue();
 import mitt from 'mitt';

 // Create an event bus
const emitter = mitt();

// Provide the event bus to all components
app.config.globalProperties.$Reload = emitter;
app.provide('emitter', emitter);