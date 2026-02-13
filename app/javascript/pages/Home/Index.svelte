<script lang="ts">
  let { user }: { user: { display_name: string; email: string } } = $props()
</script>

<div>
  <h1 class="font-bold text-4xl">Home#index</h1>
  <p>Find me in app/javascript/pages/Home/Index.svelte</p>
  <p>You're logged in as {user.display_name} ({user.email})</p>
</div>
