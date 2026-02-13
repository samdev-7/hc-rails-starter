<script lang="ts">
  import { Link } from '@inertiajs/svelte'
  import type { AdminUserDetail } from '@/types'

  let {
    user,
    projects,
  }: {
    user: AdminUserDetail
    projects: { id: number; name: string; ships_count: number; is_unlisted: boolean; created_at: string }[]
  } = $props()
</script>

<div class="max-w-4xl mx-auto py-8">
  <div class="flex items-center gap-4 mb-6">
    <img src={user.avatar} alt={user.display_name} class="w-16 h-16 rounded-full" />
    <div>
      <h1 class="font-bold text-4xl">
        {user.display_name}
        {#if user.is_discarded}
          <span class="text-sm text-red-500 font-normal">Deleted on {user.discarded_at}</span>
        {/if}
      </h1>
      <p class="text-gray-500">{user.email}</p>
    </div>
  </div>

  <div class="grid grid-cols-2 gap-4 mb-6">
    <div>
      <span class="text-sm text-gray-500">Roles</span>
      <p>{user.roles.join(', ')}</p>
    </div>
    <div>
      <span class="text-sm text-gray-500">Timezone</span>
      <p>{user.timezone}</p>
    </div>
    <div>
      <span class="text-sm text-gray-500">Joined</span>
      <p>{user.created_at}</p>
    </div>
    <div>
      <span class="text-sm text-gray-500">Banned</span>
      <p>{user.is_banned ? 'Yes' : 'No'}</p>
    </div>
  </div>

  <h2 class="font-bold text-2xl mb-4">Projects ({projects.length})</h2>

  {#if projects.length > 0}
    <table class="w-full border-collapse">
      <thead>
        <tr class="border-b text-left">
          <th class="py-2 px-3">Name</th>
          <th class="py-2 px-3">Ships</th>
          <th class="py-2 px-3">Unlisted</th>
          <th class="py-2 px-3">Created</th>
        </tr>
      </thead>
      <tbody>
        {#each projects as project}
          <tr class="border-b hover:bg-gray-50">
            <td class="py-2 px-3"
              ><Link href="/admin/projects/{project.id}" class="text-blue-600 hover:underline">{project.name}</Link></td
            >
            <td class="py-2 px-3">{project.ships_count}</td>
            <td class="py-2 px-3">{project.is_unlisted ? 'Yes' : 'No'}</td>
            <td class="py-2 px-3">{project.created_at}</td>
          </tr>
        {/each}
      </tbody>
    </table>
  {:else}
    <p class="text-gray-500">No projects yet.</p>
  {/if}
</div>
