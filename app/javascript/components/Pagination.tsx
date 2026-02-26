import { router } from '@inertiajs/react'
import type { PagyProps } from '@/types'

export default function Pagination({ pagy }: { pagy: PagyProps }) {
  function goToPage(pageNum: number) {
    const url = new URL(window.location.href)
    url.searchParams.set('page', String(pageNum))
    router.get(url.pathname + url.search, {}, { preserveState: true })
  }

  if (pagy.pages <= 1) return null

  return (
    <nav className="flex items-center gap-2 mt-6">
      {pagy.prev && (
        <button onClick={() => goToPage(pagy.prev!)} className="px-3 py-1 border rounded hover:bg-gray-100">
          Previous
        </button>
      )}
      <span className="text-sm text-gray-600">
        Page {pagy.page} of {pagy.pages}
      </span>
      {pagy.next && (
        <button onClick={() => goToPage(pagy.next!)} className="px-3 py-1 border rounded hover:bg-gray-100">
          Next
        </button>
      )}
    </nav>
  )
}
