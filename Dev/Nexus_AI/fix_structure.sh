#!/bin/bash

# Ensure script is run from project root
if [ ! -d "Nexus_AI" ]; then
    echo "🚨 Error: Nexus_AI directory not found. Run this script from the root project folder."
    exit 1
fi

echo "🔍 Fixing folder structure..."

# Move contents from nexus_ai/Nexus_Infinity/ to Nexus_AI/
if [ -d "nexus_ai/Nexus_Infinity" ]; then
    echo "📂 Moving files from nexus_ai/Nexus_Infinity to Nexus_AI..."
    mv nexus_ai/Nexus_Infinity/* Nexus_AI/
    rm -rf nexus_ai/
    echo "✅ Cleanup complete! Extra folders removed."
else
    echo "✅ No duplicate structure found. No changes needed."
fi

# Ensure no duplicate folders are regenerated
echo "🚫 Locking structure in .gitignore..."
echo "nexus_ai/" >> .gitignore
echo "NexusInfinityAI/" >> .gitignore
git add .gitignore
git commit -m "Locked in correct project structure"
git push origin develop

echo "🎉 Structure is now locked. You're ready to work with a clean repo!"
