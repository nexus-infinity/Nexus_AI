import './globals.css'
import type { Metadata } from 'next'

export const metadata: Metadata = {
  title: 'Zion Platform',
  description: 'Community advocacy marketplace',
}

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}