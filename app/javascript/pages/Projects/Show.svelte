<script lang="ts">
  import { router, Link } from '@inertiajs/svelte'
  import type { ProjectDetail } from '@/types'

  let { project, can }: { project: ProjectDetail; can: { update: boolean; destroy: boolean } } = $props()

  function deleteProject() {
    if (confirm('Are you sure?')) {
      router.delete(`/projects/${project.id}`)
    }
  }

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
  <div class="flex items-center justify-between mb-6">
    <h1 class="font-bold text-4xl">{project.name}</h1>
    <div class="flex gap-2">
      {#if can.update}
        <Link href="/projects/{project.id}/edit" class="bg-gray-200 px-4 py-2 rounded hover:bg-gray-300">Edit</Link>
      {/if}
      {#if can.destroy}
        <button onclick={deleteProject} class="bg-red-600 text-white px-4 py-2 rounded hover:bg-red-700">Delete</button>
      {/if}
    </div>
  </div>

  {#if project.is_unlisted}
    <span class="inline-block bg-yellow-100 text-yellow-800 text-sm px-2 py-1 rounded mb-4">Unlisted</span>
  {/if}

  {#if project.description}
    <p class="text-gray-700 mb-4">{project.description}</p>
  {/if}

  {#if project.tags.length > 0}
    <div class="flex flex-wrap gap-2 mb-4">
      {#each project.tags as tag}
        <span class="bg-gray-100 text-gray-700 text-sm px-2 py-1 rounded">{tag}</span>
      {/each}
    </div>
  {/if}

  <div class="flex gap-4 text-sm text-gray-500 mb-6">
    {#if isSafeUrl(project.demo_link)}
      <a href={project.demo_link} target="_blank" rel="noopener" class="text-blue-600 hover:underline">Demo</a>
    {/if}
    {#if isSafeUrl(project.repo_link)}
      <a href={project.repo_link} target="_blank" rel="noopener" class="text-blue-600 hover:underline">Repository</a>
    {/if}
  </div>

  <p class="text-sm text-gray-500">Created by {project.user_display_name} on {project.created_at}</p>
</div>
