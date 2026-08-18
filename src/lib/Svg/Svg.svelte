<script>
  import { copyToClipboard } from '../../App.svelte'
  import SvgToBase64 from './SvgToBase64.svelte'
  import SvgToBladeComponent from './SvgToBladeComponent.svelte'
</script>

<section class="bg-gray p-4 rounded-lg border-2 border-rebeccapurple col-span-full">
  <h2 class="text-2xl font-bold mb-4">SVG</h2>
  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-6 gap-4">
    <fieldset class="flex flex-col gap-y-4 lg:col-span-2 border-2 border-secondary min-w-full p-2 pb-3 rounded-lg relative md:max-lg:-order-6">
      <legend class="text-sm font-bold text-secondary px-1">Svg to Base64</legend>
      <SvgToBase64 />
      <div class="text-xs text-secondary px-1 absolute bottom-0 right-4 bg-gray tranform translate-y-1/2">Click to copy to clipboard</div>
    </fieldset>
    <fieldset class="lg:col-span-2 border-2 border-secondary min-w-full p-2 pb-3 rounded-lg relative md:max-lg:-order-4">
      <legend class="text-sm font-bold text-secondary px-1">Svg to Blade Component</legend>
      <SvgToBladeComponent />
      <div class="text-xs text-secondary px-1 absolute bottom-0 right-4 bg-gray tranform translate-y-1/2">Click to copy to clipboard</div>
    </fieldset>
  </div>
</section>