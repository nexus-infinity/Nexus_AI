import { Folder, File } from 'lucide-react'
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card"

export default function DocsIndex() {
  const docsStructure = [
    { name: "docs", icon: Folder, children: [
      { name: "ai", icon: Folder, children: [{ name: "README.md", icon: File }] },
      { name: "backend", icon: Folder, children: [{ name: "README.md", icon: File }] },
      { name: "examples", icon: Folder, children: [{ name: "(Example components)", icon: File }] },
      { name: "frontend", icon: Folder, children: [{ name: "README.md", icon: File }] },
      { name: "infrastructure", icon: Folder, children: [{ name: "README.md", icon: File }] },
      { name: "project-structure", icon: Folder, children: [
        { name: "DocsIndex.tsx", icon: File },
        { name: "(Project structure visualizations)", icon: File }
      ]},
      { name: "scripts", icon: Folder, children: [{ name: "README.md", icon: File }] },
      { name: "shared", icon: Folder, children: [{ name: "README.md", icon: File }] },
    ]}
  ]

  const renderTree = (items) => (
    <ul className="pl-4">
      {items.map((item, index) => (
        <li key={index} className="my-2">
          <div className="flex items-center">
            <item.icon className="w-4 h-4 mr-2 text-primary" />
            <span>{item.name}</span>
          </div>
          {item.children && renderTree(item.children)}
        </li>
      ))}
    </ul>
  )

  return (
    <Card className="w-full max-w-md">
      <CardHeader>
        <CardTitle>Nexus Documentation Structure</CardTitle>
        <CardDescription>Overview of the docs folder organization</CardDescription>
      </CardHeader>
      <CardContent>
        {renderTree(docsStructure)}
      </CardContent>
    </Card>
  )
}