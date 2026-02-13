<script lang="ts">
  let { content_html, page_title }: { content_html: string; page_title: string } = $props()
</script>

<svelte:head>
  <title>{page_title} - Hc Rails Starter</title>
</svelte:head>

<div class="markdown-content">
  {@html content_html}
</div>
