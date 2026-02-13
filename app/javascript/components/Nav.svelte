<script lang="ts">
  import { page, router, Link } from '@inertiajs/svelte'
  import type { SharedProps } from '@/types'

  let shared = $derived($page.props as unknown as SharedProps)

  function signOut(e: Event) {
    e.preventDefault()
    router.delete(shared.sign_out_path)
  }
</script>

<nav>
  {#if shared.auth.user}
    <button onclick={signOut}>Sign Out</button>
  {:else}
    <Link href={shared.sign_in_path}>Sign In with Slack</Link>
  {/if}
</nav>
