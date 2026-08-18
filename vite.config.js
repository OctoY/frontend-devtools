import postcss from './postcss.config.js';
import { svelte } from '@sveltejs/vite-plugin-svelte'
import { defineConfig } from 'vite'

// https://vitejs.dev/config/
export default defineConfig({
  // Served from https://<user>.github.io/frontend-devtools/ on GitHub Pages,
  // override with the BASE_PATH env var when building for another target.
  base: process.env.BASE_PATH ?? '/frontend-devtools/',
  plugins: [svelte()],
  css:{
    postcss
  }
})
