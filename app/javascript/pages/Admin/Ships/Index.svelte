<script lang="ts">
  import { Link } from '@inertiajs/svelte'
  import Pagination from '@/components/Pagination.svelte'
  import type { AdminShipRow, PagyProps } from '@/types'

  let { ships, pagy }: { ships: AdminShipRow[]; pagy: PagyProps } = $props()
</script>

<div class="max-w-6xl mx-auto py-8">
  <h1 class="font-bold text-4xl mb-6">Admin: Reviews</h1>

  <table class="w-full border-collapse">
    <thead>
      <tr class="border-b text-left">
        <th class="py-2 px-3">Project</th>
        <th class="py-2 px-3">Owner</th>
        <th class="py-2 px-3">Status</th>
        <th class="py-2 px-3">Reviewer</th>
        <th class="py-2 px-3">Created</th>
        <th class="py-2 px-3"></th>
      </tr>
    </thead>
    <tbody>
      {#each ships as ship}
        <tr class="border-b hover:bg-gray-50">
          <td class="py-2 px-3">{ship.project_name}</td>
          <td class="py-2 px-3">{ship.user_display_name}</td>
          <td class="py-2 px-3"><span class="capitalize">{ship.status}</span></td>
          <td class="py-2 px-3">{ship.reviewer_display_name ?? 'Unassigned'}</td>
          <td class="py-2 px-3">{ship.created_at}</td>
          <td class="py-2 px-3">
            <Link href="/admin/reviews/{ship.id}" class="text-blue-600 hover:underline">View</Link>
          </td>
        </tr>
      {/each}
    </tbody>
  </table>

  <Pagination {pagy} />
</div>
