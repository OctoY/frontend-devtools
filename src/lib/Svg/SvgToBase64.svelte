<script>  
  import { OverlayScrollbars } from 'overlayscrollbars'
  import { OverlayScrollbarsComponent } from "overlayscrollbars-svelte"
  import { copyToClipboard } from '../../App.svelte'

  let svg = '<svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512"><!--! Font Awesome Free 6.4.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM216 336h24V272H216c-13.3 0-24-10.7-24-24s10.7-24 24-24h48c13.3 0 24 10.7 24 24v88h8c13.3 0 24 10.7 24 24s-10.7 24-24 24H216c-13.3 0-24-10.7-24-24s10.7-24 24-24zm40-208a32 32 0 1 1 0 64 32 32 0 1 1 0-64z"/></svg>'

  let base64Svg={
    'url': '',
    'data': '',
    'raw': ''
  }

  function updateAll(){
    console.log(btoa(svg))
    base64Svg['raw'] = btoa(svg)
    base64Svg['data'] = 'data:image/svg+xml;base64,' + base64Svg['raw']
    base64Svg['url'] = 'url("' + base64Svg['data'] + '")'
  }
</script>
<label class="flex flex-col gap-y-0.5 text-secondary mb-2 block">
  <span class="text-xs">Paste SVG markup here</span>
  <!--<OverlayScrollbarsComponent
    element="textarea"
    class="bg-white text-black py-1 px-2 rounded focus:outline-rebeccapurple focus:outline focus:outline-2 focus:bg-coffee focus:text-rebeccapurple max-w-full"
    rows="8"
    options={{ 
      scrollbars: { 
        autoHide: 'never',
        theme: 'os-theme-light'
      }
    }}
    events={{ scroll: () => { /* ... */ } }}
    defer
    bind:value={svg}
    on:input={() => updateAll()}
/>-->
<textarea class="bg-white text-black py-1 px-2 rounded focus:outline-rebeccapurple focus:outline focus:outline-2 focus:bg-coffee focus:text-rebeccapurple max-w-full" rows="8" bind:value={svg} on:input={() => updateAll()} />
</label>
<div class="bg-readonly aspect-square flex rounded [&_svg]:w-full [&_svg]:h-full p-4">
  {@html svg}
</div>
<label class="flex flex-col gap-y-0.5 text-secondary mb-2 block">
  <span class="text-xs">URL string</span>
  <input type="button" class="bg-readonly text-white text-left cursor-clipboard py-1 px-2 rounded overflow-hidden text-ellipsis w-full" value="{base64Svg['url']}" on:click={(e) => copyToClipboard(e.target.value)}>
</label>
<label class="flex flex-col gap-y-0.5 text-secondary mb-2 block">
  <span class="text-xs">Data URI</span>
  <input type="button" class="bg-readonly text-white text-left cursor-clipboard py-1 px-2 rounded overflow-hidden text-ellipsis w-full" value="{base64Svg['data']}" on:click={(e) => copyToClipboard(e.target.value)}>
</label>
<label class="flex flex-col gap-y-0.5 text-secondary mb-2 block">
  <span class="text-xs">Raw Base64</span>
  <input type="button" class="bg-readonly text-white text-left cursor-clipboard py-1 px-2 rounded overflow-hidden text-ellipsis w-full" value="{base64Svg['raw']}" on:click={(e) => copyToClipboard(e.target.value)}>
</label>

<style>
  @import 'overlayscrollbars/overlayscrollbars.css';
</style>