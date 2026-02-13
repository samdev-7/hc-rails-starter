<script lang="ts">
  import { Link } from '@inertiajs/svelte'
  import type { AdminProjectDetail } from '@/types'

  let { project, ships }: {
    project: AdminProjectDetail
    ships: { id: number; status: string; reviewer_display_name: string | null; approved_seconds: number | null; created_at: string }[]
  } = $props()

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
  <h1 class="font-bold text-4xl mb-2">
    {project.name}
    {#if project.is_discarded}
      <span class="text-sm text-red-500 font-normal">Deleted on {project.discarded_at}</span>
    {/if}
  </h1>
  <p class="text-gray-500 mb-6">Owned by <Link href="/admin/users/{project.user_id}" class="text-blue-600 hover:underline">{project.user_display_name}</Link></p>

  <div class="grid grid-cols-2 gap-4 mb-6">
    <div>
      <span class="text-sm text-gray-500">Unlisted</span>
      <p>{project.is_unlisted ? 'Yes' : 'No'}</p>
    </div>
    <div>
      <span class="text-sm text-gray-500">Tags</span>
      <p>{project.tags.length > 0 ? project.tags.join(', ') : 'None'}</p>
    </div>
    <div>
      <span class="text-sm text-gray-500">Demo Link</span>
      <p>
        {#if isSafeUrl(project.demo_link)}
          <a href={project.demo_link} target="_blank" rel="noopener" class="text-blue-600 hover:underline">{project.demo_link}</a>
        {:else}
          None
        {/if}
      </p>
    </div>
    <div>
      <span class="text-sm text-gray-500">Repo Link</span>
      <p>
        {#if isSafeUrl(project.repo_link)}
          <a href={project.repo_link} target="_blank" rel="noopener" class="text-blue-600 hover:underline">{project.repo_link}</a>
        {:else}
          None
        {/if}
      </p>
    </div>
  </div>

  {#if project.description}
    <div class="mb-6">
      <span class="text-sm text-gray-500">Description</span>
      <p class="mt-1">{project.description}</p>
    </div>
  {/if}

  <h2 class="font-bold text-2xl mb-4">Ships ({ships.length})</h2>

  {#if ships.length > 0}
    <table class="w-full border-collapse">
      <thead>
        <tr class="border-b text-left">
          <th class="py-2 px-3">Status</th>
          <th class="py-2 px-3">Reviewer</th>
          <th class="py-2 px-3">Approved Seconds</th>
          <th class="py-2 px-3">Created</th>
          <th class="py-2 px-3"></th>
        </tr>
      </thead>
      <tbody>
        {#each ships as ship}
          <tr class="border-b hover:bg-gray-50">
            <td class="py-2 px-3"><span class="capitalize">{ship.status}</span></td>
            <td class="py-2 px-3">{ship.reviewer_display_name ?? 'Unassigned'}</td>
            <td class="py-2 px-3">{ship.approved_seconds ?? '—'}</td>
            <td class="py-2 px-3">{ship.created_at}</td>
            <td class="py-2 px-3"><Link href="/admin/reviews/{ship.id}" class="text-blue-600 hover:underline">View</Link></td>
          </tr>
        {/each}
      </tbody>
    </table>
  {:else}
    <p class="text-gray-500">No ships yet.</p>
  {/if}
</div>
