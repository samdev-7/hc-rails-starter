import { usePage } from '@inertiajs/react'
import type { SharedProps } from '@/types'

export default function FlashMessages() {
  const { flash } = usePage<SharedProps>().props

  return (
    <>
      {flash.notice && <p>Notice: {flash.notice}</p>}
      {flash.alert && <p>Alert: {flash.alert}</p>}
    </>
  )
}
