<script lang="ts">
  import { page } from '@inertiajs/svelte'
  import type { SharedProps } from '@/types'

  let shared = $derived($page.props as unknown as SharedProps)
</script>

{#if shared.flash.notice}
  <p>Notice: {shared.flash.notice}</p>
{/if}
{#if shared.flash.alert}
  <p>Alert: {shared.flash.alert}</p>
{/if}
