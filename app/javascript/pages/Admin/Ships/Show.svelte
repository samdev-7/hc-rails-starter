<script lang="ts">
  import { Link } from '@inertiajs/svelte'
  import type { AdminShipDetail } from '@/types'

  let { ship, can }: { ship: AdminShipDetail; can: { update: boolean } } = $props()

  function isSafeUrl(url: string | null): boolean {
    if (!url) return false
    try {
      const parsed = new URL(url)
      return parsed.protocol === 'http:' || parsed.protocol === 'https:'
    } catch {
      return false
    }
  }
</script>

<div class="max-w-4xl mx-auto py-8">
  <h1 class="font-bold text-4xl mb-2">Ship #{ship.id}</h1>
  <p class="text-gray-500 mb-6">for {ship.project_name} by {ship.user_display_name}</p>

  <div class="grid grid-cols-2 gap-4 mb-6">
    <div>
      <span class="text-sm text-gray-500">Status</span>
      <p class="capitalize">{ship.status}</p>
    </div>
    <div>
      <span class="text-sm text-gray-500">Reviewer</span>
      <p>{ship.reviewer_display_name ?? 'Unassigned'}</p>
    </div>
    <div>
      <span class="text-sm text-gray-500">Approved Seconds</span>
      <p>{ship.approved_seconds ?? '—'}</p>
    </div>
    <div>
      <span class="text-sm text-gray-500">Created</span>
      <p>{ship.created_at}</p>
    </div>
  </div>

  {#if ship.justification}
    <div class="mb-4">
      <span class="text-sm text-gray-500">Justification</span>
      <p class="mt-1">{ship.justification}</p>
    </div>
  {/if}

  {#if ship.feedback}
    <div class="mb-4">
      <span class="text-sm text-gray-500">Feedback</span>
      <p class="mt-1">{ship.feedback}</p>
    </div>
  {/if}

  <div class="grid grid-cols-2 gap-4 mb-6">
    <div>
      <span class="text-sm text-gray-500">Frozen Demo Link</span>
      <p>
        {#if isSafeUrl(ship.frozen_demo_link)}
          <a href={ship.frozen_demo_link} target="_blank" rel="noopener" class="text-blue-600 hover:underline"
            >{ship.frozen_demo_link}</a
          >
        {:else}
          —
        {/if}
      </p>
    </div>
    <div>
      <span class="text-sm text-gray-500">Frozen Repo Link</span>
      <p>
        {#if isSafeUrl(ship.frozen_repo_link)}
          <a href={ship.frozen_repo_link} target="_blank" rel="noopener" class="text-blue-600 hover:underline"
            >{ship.frozen_repo_link}</a
          >
        {:else}
          —
        {/if}
      </p>
    </div>
  </div>

  {#if can.update}
    <div class="mt-6">
      <Link href="/admin/reviews/{ship.id}/edit" class="bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700"
        >Edit</Link
      >
    </div>
  {/if}
</div>
