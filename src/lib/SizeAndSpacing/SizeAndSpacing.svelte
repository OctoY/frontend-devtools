<script>
  import { copyToClipboard } from '../../App.svelte'
  import Width from './Width.svelte'
  import Height from './Height.svelte'
  import MinWidth from './MinWidth.svelte'
  import MinHeight from './MinHeight.svelte'
  import MaxWidth from './MaxWidth.svelte'
  import MaxHeight from './MaxHeight.svelte'
  import Padding from './Padding.svelte'
  import Margin from './Margin.svelte'
</script>

<script context="module">
  import { size as width } from './Width.svelte'
  import { size as height } from './Height.svelte'
  import { size as minWidth } from './MinWidth.svelte'
  import { size as minHeight } from './MinHeight.svelte'
  import { size as maxWidth } from './MaxWidth.svelte'
  import { size as maxHeight } from './MaxHeight.svelte'
  import { spacing as padding } from './Padding.svelte'
  import { spacing as margin } from './Margin.svelte'
  import { writable } from 'svelte/store'
  import { get } from 'svelte/store'
  import defaultTheme from 'tailwindcss/defaultTheme'
 
  const tailwindPreciseClasses = writable('')
  const tailwindRoundedClasses = writable('')


  const tailwindWidthConversionTable = Object.fromEntries(
    Object.entries(defaultTheme.spacing)
    .map(([key, value]) => [value, key])
  )
  const tailwindMinWidthConversionTable = Object.fromEntries(
    Object.entries(defaultTheme.spacing)
    .map(([key, value]) => [value, key])
  )  
  const tailwindMaxWidthConversionTable = Object.fromEntries(
    Object.entries(defaultTheme.spacing)
    .map(([key, value]) => [value, key])
  )
  const tailwindHeightConversionTable = Object.fromEntries(
    Object.entries(defaultTheme.spacing)
    .map(([key, value]) => [value, key])
  )  
  const tailwindMinHeightConversionTable = Object.fromEntries(
    Object.entries(defaultTheme.spacing)
    .map(([key, value]) => [value, key])
  )
  const tailwindMaxHeightConversionTable = Object.fromEntries(
    Object.entries(defaultTheme.spacing)
    .map(([key, value]) => [value, key])
  )
  const tailwindPaddingConversionTable = Object.fromEntries(
    Object.entries(defaultTheme.spacing)
    .map(([key, value]) => [value, key])
  )
  const tailwindMarginConversionTable = Object.fromEntries(
    Object.entries(defaultTheme.spacing)
    .map(([key, value]) => [value, key])
  )
  
  let tailwindPreciseClassesArray = []
  let tailwindRoundedClassesArray = []

  export function toTailwindClasses(){
    tailwindPreciseClassesArray = []
    tailwindRoundedClassesArray = []

    addTailwindSizeClasses(get(width), 'w', tailwindWidthConversionTable)
    addTailwindSizeClasses(get(minWidth), 'min-w', tailwindMinWidthConversionTable)
    addTailwindSizeClasses(get(maxWidth), 'max-w', tailwindMaxWidthConversionTable)
    addTailwindSizeClasses(get(height), 'h', tailwindHeightConversionTable)
    addTailwindSizeClasses(get(minHeight), 'min-h', tailwindMinHeightConversionTable)
    addTailwindSizeClasses(get(maxHeight), 'max-h', tailwindMaxHeightConversionTable)
    addTailwindSizeClasses(get(maxHeight), 'max-h', tailwindMaxHeightConversionTable)
    addTailwindSizeClasses(get(maxHeight), 'max-h', tailwindMaxHeightConversionTable)
    addTailwindSpacingClasses(get(padding), 'p', tailwindPaddingConversionTable)
    addTailwindSpacingClasses(get(margin), 'm', tailwindMarginConversionTable)

    tailwindPreciseClasses.set(tailwindPreciseClassesArray.join(' '))
    tailwindRoundedClasses.set(tailwindRoundedClassesArray.join(' '))
  }

  function addTailwindSizeClasses(rawVal, prefix, conversionTable){
    for (var key in rawVal){
      let val
      formatTailwindClass(key, prefix, '', rawVal[key], conversionTable)
    }
  }

  function addTailwindSpacingClasses(rawVal, prefix, conversionTable){
    for (var key in rawVal){
      let val = rawVal[key].split(' ')
      switch(val.length){
        case 1:
          formatTailwindClass(key, prefix, '', val[0], conversionTable)
          break
        case 2:
          formatTailwindClass(key, prefix, 'x', val[1], conversionTable)
          formatTailwindClass(key, prefix, 'y', val[0], conversionTable)
          break
        case 3:
          formatTailwindClass(key, prefix, 'x', val[1], conversionTable)
          formatTailwindClass(key, prefix, 't', val[0], conversionTable)
          formatTailwindClass(key, prefix, 'b', val[2], conversionTable)
          break
        default:
          formatTailwindClass(key, prefix, 'l', val[1], conversionTable)
          formatTailwindClass(key, prefix, 'r', val[3], conversionTable)
          formatTailwindClass(key, prefix, 't', val[0], conversionTable)
          formatTailwindClass(key, prefix, 'b', val[2], conversionTable)
      }
    }
  }

  function formatTailwindClass(key, prefix, prefixModifier, rawVal, conversionTable){
    let preciseVal
    let roundedVal
    if( rawVal !== ''){
      if( parseFloat(rawVal, 10) == 0) rawVal = '0px'
      if( rawVal == "0.0625rem") rawVal = '1px'
      if(typeof conversionTable[rawVal] !== 'undefined') preciseVal = roundedVal = conversionTable[rawVal]
      else{
        preciseVal = '[' + rawVal + ']'
        if(!rawVal.endsWith('rem')) roundedVal = '[' + rawVal + ']'
        else{
          console.log(conversionTable)
          rawVal = Object.keys(conversionTable).reduce(function(prev, curr) {
            return (Math.abs(parseFloat(curr) - parseFloat(rawVal)) < Math.abs(parseFloat(prev) - parseFloat(rawVal)) ? curr : prev)
          })
          roundedVal = conversionTable[rawVal]
        }
      }
      if( key == 'xs'){
        tailwindPreciseClassesArray.push(prefix + prefixModifier + '-' + preciseVal)
        tailwindRoundedClassesArray.push(prefix + prefixModifier + '-' + roundedVal)
      } else{
        tailwindPreciseClassesArray.push(key + ':' + prefix + '-' + preciseVal)
        tailwindRoundedClassesArray.push(key + ':' + prefix + '-' + roundedVal)
      } 
    }
  }
</script>

<section class="bg-gray p-4 rounded-lg border-2 border-rebeccapurple col-span-full">
  <h2 class="text-2xl font-bold mb-4">Size & Spacing - px to rem to Tailwind Classes convertor</h2>
  <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-6 gap-4">
    <fieldset class="lg:col-span-2 border-2 border-secondary min-w-full p-2 pb-3 rounded-lg relative md:max-lg:-order-6">
      <legend class="text-sm font-bold text-secondary px-1">Width</legend>
      <Width />
      <div class="text-xs text-secondary px-1 absolute bottom-0 right-4 bg-gray tranform translate-y-1/2">Click to copy to clipboard</div>
    </fieldset>
    <fieldset class="lg:col-span-2 border-2 border-secondary min-w-full p-2 pb-3 rounded-lg relative md:max-lg:-order-4">
      <legend class="text-sm font-bold text-secondary px-1">Min-Width</legend>
      <MinWidth />
      <div class="text-xs text-secondary px-1 absolute bottom-0 right-4 bg-gray tranform translate-y-1/2">Click to copy to clipboard</div>
    </fieldset>
    <fieldset class="lg:col-span-2 border-2 border-secondary min-w-full p-2 pb-3 rounded-lg relative md:max-lg:-order-2">
      <legend class="text-sm font-bold text-secondary px-1">Max-Width</legend>
      <MaxWidth />
      <div class="text-xs text-secondary px-1 absolute bottom-0 right-4 bg-gray tranform translate-y-1/2">Click to copy to clipboard</div>
    </fieldset>
    <fieldset class="lg:col-span-2 border-2 border-secondary min-w-full p-2 pb-3 rounded-lg relative md:max-lg:-order-5">
      <legend class="text-sm font-bold text-secondary px-1">Height</legend>
      <Height />
      <div class="text-xs text-secondary px-1 absolute bottom-0 right-4 bg-gray tranform translate-y-1/2">Click to copy to clipboard</div>
    </fieldset>
    <fieldset class="lg:col-span-2 border-2 border-secondary min-w-full p-2 pb-3 rounded-lg relative md:max-lg:-order-3">
      <legend class="text-sm font-bold text-secondary px-1">Min-Height</legend>
      <MinHeight />
      <div class="text-xs text-secondary px-1 absolute bottom-0 right-4 bg-gray tranform translate-y-1/2">Click to copy to clipboard</div>
    </fieldset>
    <fieldset class="lg:col-span-2 border-2 border-secondary min-w-full p-2 pb-3 rounded-lg relative md:max-lg:-order-1">
      <legend class="text-sm font-bold text-secondary px-1">Max-Height</legend>
      <MaxHeight />
      <div class="text-xs text-secondary px-1 absolute bottom-0 right-4 bg-gray tranform translate-y-1/2">Click to copy to clipboard</div>
    </fieldset>
    <fieldset class="lg:col-span-3 border-2 border-secondary min-w-full p-2 pb-3 rounded-lg relative">
      <legend class="text-sm font-bold text-secondary px-1">Padding</legend>
      <Padding />
      <div class="text-xs text-secondary px-1 absolute bottom-0 right-4 bg-gray tranform translate-y-1/2">Click to copy to clipboard</div>
    </fieldset>
    <fieldset class="lg:col-span-3 border-2 border-secondary min-w-full p-2 pb-3 rounded-lg relative">
      <legend class="text-sm font-bold text-secondary px-1">Margin</legend>
      <Margin />
      <div class="text-xs text-secondary px-1 absolute bottom-0 right-4 bg-gray tranform translate-y-1/2">Click to copy to clipboard</div>
    </fieldset>
    <fieldset class="border-2 border-secondary min-w-full p-2 pb-3 rounded-lg relative col-span-full">
      <legend class="text-sm font-bold text-secondary px-1">Tailwind Precise Classes</legend>
      <input type="button" class="bg-readonly text-white text-left cursor-clipboard py-1 px-2 rounded overflow-hidden text-ellipsis w-full" tabindex="-1" value="{$tailwindPreciseClasses}" on:click={(e) => copyToClipboard(e.target.value)}>
      <div class="text-xs text-secondary px-1 absolute bottom-0 right-4 bg-gray tranform translate-y-1/2">Click to copy to clipboard</div>
    </fieldset>
    <fieldset class="border-2 border-secondary min-w-full p-2 pb-3 rounded-lg relative col-span-full">
      <legend class="text-sm font-bold text-secondary px-1">Tailwind Rounded Classes</legend>
      <input type="button" class="bg-readonly text-white text-left cursor-clipboard py-1 px-2 rounded overflow-hidden text-ellipsis w-full" tabindex="-1" value="{$tailwindRoundedClasses}" on:click={(e) => copyToClipboard(e.target.value)}>
      <div class="text-xs text-secondary px-1 absolute bottom-0 right-4 bg-gray tranform translate-y-1/2">Click to copy to clipboard</div>
    </fieldset>
  </div>
</section>