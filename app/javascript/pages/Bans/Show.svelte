<script lang="ts">
  import { page, router } from '@inertiajs/svelte'
  import type { SharedProps } from '@/types'

  let shared = $derived($page.props as unknown as SharedProps)

  function signOut(e: Event) {
    e.preventDefault()
    router.delete(shared.sign_out_path)
  }
</script>

<div class="max-w-2xl mx-auto py-16 text-center">
  <h1 class="font-bold text-4xl mb-4">Account Suspended</h1>
  <p class="text-gray-600 mb-8">Your account has been suspended. If you believe this is a mistake, please reach out to us for assistance.</p>
  <button onclick={signOut} class="text-blue-600 hover:underline">Sign Out</button>
</div>
