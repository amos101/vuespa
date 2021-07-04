import Vue from 'vue';
import Router from 'vue-router';
import Home from './view/Home.vue';
import Show from "./view/Show.vue";

Vue.use (Router)

export default new Router({
  mode: "history",
  routes: [
    {path: '/', component: Home},
    {path: '/show/:id', component: Show}
  ]
});