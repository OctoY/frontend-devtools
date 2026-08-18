<script context="module">
  import Spacing from './Spacing.svelte'
  import { writable } from 'svelte/store'

  export const spacing = writable({
    'xs': '',
    'sm': '',
    'md': '',
    'lg': '',
    'xl': '',
    'xxl': ''
  })
</script>

<Spacing spacing={ $spacing } />
