export default function HomeIndex({ user }: { user: { display_name: string; email: string } }) {
  return (
    <div>
      <h1 className="font-bold text-4xl">Home#index</h1>
      <p>Find me in app/javascript/pages/Home/Index.tsx</p>
      <p>
        You're logged in as {user.display_name} ({user.email})
      </p>
    </div>
  )
}
