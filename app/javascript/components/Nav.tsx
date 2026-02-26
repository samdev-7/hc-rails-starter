import { usePage, router } from '@inertiajs/react'
import type { SharedProps } from '@/types'

export default function Nav() {
  const shared = usePage<SharedProps>().props

  function signOut(e: React.MouseEvent) {
    e.preventDefault()
    router.delete(shared.sign_out_path)
  }

  return (
    <nav>
      {shared.auth.user ? (
        <button onClick={signOut}>Sign Out</button>
      ) : (
        <a href={shared.sign_in_path}>Sign In with Slack</a>
      )}
    </nav>
  )
}
