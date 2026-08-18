<script>
  import SizeAndSpacing from './lib/SizeAndSpacing/SizeAndSpacing.svelte';
  import Svg from './lib/Svg/Svg.svelte';
</script>

<script context="module">
  export function copyToClipboard(val){
    navigator.clipboard.writeText(val);
  }
</script>

<div>
  <h1 class="text-5xl font-black text-center mb-8"><span class="bg-gradient-to-r from-current to-current bg-no-repeat bg-right-bottom bg-[length:0_4px] hover:bg-left-bottom hover:bg-[length:100%_4px] hover:text-coffee transition-[color,_background-size] duration-300">Frontend DevTools</span></h1>
  <div class="grid grid-cols-1 md:grid-cols-2 gap-4 md:gap-8">
    <SizeAndSpacing />
    <Svg />
  </div>
</div>
