#!/bin/bash

# 🚀 Nexus AI: Project Directory Setup
# Ensures the correct project folder structure for Nexus AI

PROJECT_ROOT="~/users/jbear/dev/nexus_ai"
FOLDERS=(
    "scripts"
    "config"
    "docs"
    "ai"
    "backend"
    "frontend"
    "infrastructure"
    "middleware"
    "testing"
    "data"
    "logs"
)

# Ensure the root project directory exists
echo "🔍 Checking if Nexus AI project root exists..."
mkdir -p $PROJECT_ROOT

# Create necessary subdirectories
echo "📂 Setting up project folders..."
for folder in "${FOLDERS[@]}"; do
    mkdir -p "$PROJECT_ROOT/$folder"
    echo "✅ Created: $PROJECT_ROOT/$folder"
done

# Set up scripts folder and main project setup script
echo "🛠 Placing setup scripts in the correct location..."
mkdir -p "$PROJECT_ROOT/scripts"
touch "$PROJECT_ROOT/scripts/setup_nexus_scaffold.sh"
chmod +x "$PROJECT_ROOT/scripts/setup_nexus_scaffold.sh"
echo "# Nexus AI Scaffold Setup Script" > "$PROJECT_ROOT/scripts/setup_nexus_scaffold.sh"

echo "✅ Nexus AI Project Directory Structure Created Successfully!"
echo "🚀 Ready for development."
