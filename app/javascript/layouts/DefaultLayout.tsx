import type { ReactNode } from 'react'
import Nav from '@/components/Nav'
import FlashMessages from '@/components/FlashMessages'

export default function DefaultLayout({ children }: { children: ReactNode }) {
  return (
    <>
      <Nav />
      <FlashMessages />
      <main>{children}</main>
    </>
  )
}
