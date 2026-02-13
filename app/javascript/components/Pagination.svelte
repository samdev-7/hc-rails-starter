<script lang="ts">
  import { router } from '@inertiajs/svelte'
  import type { PagyProps } from '@/types'

  let { pagy }: { pagy: PagyProps } = $props()

  function goToPage(pageNum: number) {
    const url = new URL(window.location.href)
    url.searchParams.set('page', String(pageNum))
    router.get(url.pathname + url.search, {}, { preserveState: true })
  }
</script>

{#if pagy.pages > 1}
  <nav class="flex items-center gap-2 mt-6">
    {#if pagy.prev}
      <button onclick={() => goToPage(pagy.prev!)} class="px-3 py-1 border rounded hover:bg-gray-100">
        Previous
      </button>
    {/if}

    <span class="text-sm text-gray-600">
      Page {pagy.page} of {pagy.pages}
    </span>

    {#if pagy.next}
      <button onclick={() => goToPage(pagy.next!)} class="px-3 py-1 border rounded hover:bg-gray-100">
        Next
      </button>
    {/if}
  </nav>
{/if}
