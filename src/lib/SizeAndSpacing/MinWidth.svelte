<script context="module">
  import Size from './Size.svelte'
  import { writable } from 'svelte/store'

  export const size = writable({
    'xs': '',
    'sm': '',
    'md': '',
    'lg': '',
    'xl': '',
    'xxl': ''
  })
</script>

<Size size={ $size } />
