<script>
  import { copyToClipboard } from '../../App.svelte'
  import { toTailwindClasses } from './SizeAndSpacing.svelte'

  export let spacing = []

  function toRem(val){
    val = val.trim().split(/\s+/)
    val.forEach( (el, i) => {
      console.log(el.toLowerCase())
      if( el.toLowerCase().endsWith('px') ) val[i] = (parseInt(el, 10) / 16)+'rem'
    })
    return val.join(' ')
  }
</script>

<div class="grid grid-cols-3 gap-2">
  <div>
    <label class="flex flex-col gap-y-0.5 text-secondary mb-2 block">
      <span class="text-xs">XS</span>
      <input type="text" class="bg-white text-black py-1 px-2 rounded focus:outline-rebeccapurple focus:outline focus:outline-2 focus:bg-coffee focus:text-rebeccapurple max-w-full" on:input={(e) => spacing['xs'] = toRem(e.target.value)} on:input={() => toTailwindClasses()}>
    </label>
    <input type="button" class="bg-readonly text-white text-left cursor-clipboard py-1 px-2 rounded overflow-hidden text-ellipsis w-full" tabindex="-1" value="{spacing['xs']}" on:click={(e) => copyToClipboard(e.target.value)}>
  </div>
  <div>
    <label class="flex flex-col gap-y-0.5 text-secondary mb-2 block">
      <span class="text-xs">SM</span>
      <input type="text" class="bg-white text-black py-1 px-2 rounded focus:outline-rebeccapurple focus:outline focus:outline-2 focus:bg-coffee focus:text-rebeccapurple max-w-full" on:input={(e) => spacing['sm'] = toRem(e.target.value)} on:input={() => toTailwindClasses()}>
    </label>
    <input type="button" class="bg-readonly text-white text-left cursor-clipboard py-1 px-2 rounded overflow-hidden text-ellipsis w-full" tabindex="-1" value="{spacing['sm']}" on:click={(e) => copyToClipboard(e.target.value)}>
  </div>
  <div>
    <label class="flex flex-col gap-y-0.5 text-secondary mb-2 block">
      <span class="text-xs">MD</span>
      <input type="text" class="bg-white text-black py-1 px-2 rounded focus:outline-rebeccapurple focus:outline focus:outline-2 focus:bg-coffee focus:text-rebeccapurple max-w-full" on:input={(e) => spacing['md'] = toRem(e.target.value)} on:input={() => toTailwindClasses()}>
    </label>
    <input type="button" class="bg-readonly text-white text-left cursor-clipboard py-1 px-2 rounded overflow-hidden text-ellipsis w-full" tabindex="-1" value="{spacing['md']}" on:click={(e) => copyToClipboard(e.target.value)}>
  </div>
  <div>
    <label class="flex flex-col gap-y-0.5 text-secondary mb-2 block">
      <span class="text-xs">LG</span>
      <input type="text" class="bg-white text-black py-1 px-2 rounded focus:outline-rebeccapurple focus:outline focus:outline-2 focus:bg-coffee focus:text-rebeccapurple max-w-full" on:input={(e) => spacing['lg'] = toRem(e.target.value)} on:input={() => toTailwindClasses()}>
    </label>
    <input type="button" class="bg-readonly text-white text-left cursor-clipboard py-1 px-2 rounded overflow-hidden text-ellipsis w-full" tabindex="-1" value="{spacing['lg']}" on:click={(e) => copyToClipboard(e.target.value)}>
  </div>
  <div>
    <label class="flex flex-col gap-y-0.5 text-secondary mb-2 block">
      <span class="text-xs">XL</span>
      <input type="text" class="bg-white text-black py-1 px-2 rounded focus:outline-rebeccapurple focus:outline focus:outline-2 focus:bg-coffee focus:text-rebeccapurple max-w-full" on:input={(e) => spacing['xl'] = toRem(e.target.value)} on:input={() => toTailwindClasses()}>
    </label>
    <input type="button" class="bg-readonly text-white text-left cursor-clipboard py-1 px-2 rounded overflow-hidden text-ellipsis w-full" tabindex="-1" value="{spacing['xl']}" on:click={(e) => copyToClipboard(e.target.value)}>
  </div>
  <div>
    <label class="flex flex-col gap-y-0.5 text-secondary mb-2 block">
      <span class="text-xs">2XL</span>
      <input type="text" class="bg-white text-black py-1 px-2 rounded focus:outline-rebeccapurple focus:outline focus:outline-2 focus:bg-coffee focus:text-rebeccapurple max-w-full" on:input={(e) => spacing['xxl'] = toRem(e.target.value)} on:input={() => toTailwindClasses()}>
    </label>
    <input type="button" class="bg-readonly text-white text-left cursor-clipboard py-1 px-2 rounded overflow-hidden text-ellipsis w-full" tabindex="-1" value="{spacing['xxl']}" on:click={(e) => copyToClipboard(e.target.value)}>
  </div>
</div>
