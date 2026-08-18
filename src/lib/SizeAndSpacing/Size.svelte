<script>
  import { copyToClipboard } from '../../App.svelte'
  import { toTailwindClasses } from './SizeAndSpacing.svelte'
  export let size = []
  function toRem(val){
    if( val.toLowerCase().endsWith('px')) return (parseInt(val, 10) / 16)+'rem'
    return val
  }
</script>

<script context="module">
</script>

<div class="grid grid-cols-6 gap-2">
  <div>
    <label class="flex flex-col gap-y-0.5 text-secondary block mb-2">
      <span class="text-xs">XS</span>
      <input type="text" class="bg-white text-black py-1 px-2 rounded focus:outline-rebeccapurple focus:outline focus:outline-2 focus:bg-coffee focus:text-rebeccapurple max-w-full" on:input={(e) => size['xs'] = toRem(e.target.value)} on:input={() => toTailwindClasses()}>
    </label>
    <input type="button" class="bg-readonly text-white text-left cursor-clipboard py-1 px-2 rounded overflow-hidden text-ellipsis w-full" tabindex="-1" value="{size['xs']}" on:click={(e) => copyToClipboard(e.target.value)}>
  </div>
  <div>
    <label class="flex flex-col gap-y-0.5 text-secondary block mb-2">
      <span class="text-xs">SM</span>
      <input type="text" class="bg-white text-black py-1 px-2 rounded focus:outline-rebeccapurple focus:outline focus:outline-2 focus:bg-coffee focus:text-rebeccapurple max-w-full" on:input={(e) => size['sm'] = toRem(e.target.value)} on:input={() => toTailwindClasses()}>
    </label>
    <input type="button" class="bg-readonly text-white text-left cursor-clipboard py-1 px-2 rounded overflow-hidden text-ellipsis w-full" tabindex="-1" value="{size['sm']}" on:click={(e) => copyToClipboard(e.target.value)}>
  </div>
  <div>
    <label class="flex flex-col gap-y-0.5 text-secondary block mb-2">
      <span class="text-xs">MD</span>
      <input type="text" class="bg-white text-black py-1 px-2 rounded focus:outline-rebeccapurple focus:outline focus:outline-2 focus:bg-coffee focus:text-rebeccapurple max-w-full" on:input={(e) => size['md'] = toRem(e.target.value)} on:input={() => toTailwindClasses()}>
    </label>
    <input type="button" class="bg-readonly text-white text-left cursor-clipboard py-1 px-2 rounded overflow-hidden text-ellipsis w-full" tabindex="-1" value="{size['md']}" on:click={(e) => copyToClipboard(e.target.value)}>
  </div>
  <div>
    <label class="flex flex-col gap-y-0.5 text-secondary block mb-2">
      <span class="text-xs">LG</span>
      <input type="text" class="bg-white text-black py-1 px-2 rounded focus:outline-rebeccapurple focus:outline focus:outline-2 focus:bg-coffee focus:text-rebeccapurple max-w-full" on:input={(e) => size['lg'] = toRem(e.target.value)} on:input={() => toTailwindClasses()}>
    </label>
    <input type="button" class="bg-readonly text-white text-left cursor-clipboard py-1 px-2 rounded overflow-hidden text-ellipsis w-full" tabindex="-1" value="{size['lg']}" on:click={(e) => copyToClipboard(e.target.value)}>
  </div>
  <div>
    <label class="flex flex-col gap-y-0.5 text-secondary block mb-2">
      <span class="text-xs">XL</span>
      <input type="text" class="bg-white text-black py-1 px-2 rounded focus:outline-rebeccapurple focus:outline focus:outline-2 focus:bg-coffee focus:text-rebeccapurple max-w-full" on:input={(e) => size['xl'] = toRem(e.target.value)} on:input={() => toTailwindClasses()}>
    </label>
    <input type="button" class="bg-readonly text-white text-left cursor-clipboard py-1 px-2 rounded overflow-hidden text-ellipsis w-full" tabindex="-1" value="{size['xl']}" on:click={(e) => copyToClipboard(e.target.value)}>
  </div>
  <div>
    <label class="flex flex-col gap-y-0.5 text-secondary block mb-2">
      <span class="text-xs">2XL</span>
      <input type="text" class="bg-white text-black py-1 px-2 rounded focus:outline-rebeccapurple focus:outline focus:outline-2 focus:bg-coffee focus:text-rebeccapurple max-w-full" on:input={(e) => size['xxl'] = toRem(e.target.value)} on:input={() => toTailwindClasses()}>
    </label>
    <input type="button" class="bg-readonly text-white text-left cursor-clipboard py-1 px-2 rounded overflow-hidden text-ellipsis w-full" tabindex="-1" value="{size['xxl']}" on:click={(e) => copyToClipboard(e.target.value)}>
  </div>
</div>
