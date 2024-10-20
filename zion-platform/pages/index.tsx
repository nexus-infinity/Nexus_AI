import AdvocacyForm from '@/components/advocacy/AdvocacyForm'
import AIAnalysis from '@/components/AI/AIAnalysis'
import NarrativeGenerator from '@/components/Narrative/NarrativeGenerator'
import LegalCaseReference from '@/components/legal/LegalCaseReference'
import ReviewPublish from '@/components/Publish/ReviewPublish'

export default function Home() {
  return (
    <main className="flex min-h-screen flex-col items-center justify-between p-24">
      <div className="z-10 max-w-5xl w-full items-center justify-between font-mono text-sm">
        <h1 className="text-4xl font-bold mb-8 text-center">Zion Platform</h1>
        <div className="space-y-8">
          <AdvocacyForm />
          <AIAnalysis />
          <NarrativeGenerator />
          <LegalCaseReference />
          <ReviewPublish />
        </div>
      </div>
    </main>
  )
}
