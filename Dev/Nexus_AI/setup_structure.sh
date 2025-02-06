#!/bin/bash
echo "🚀 Setting up Nexus Infinity AI project structure..."

# Base project directory
BASE_DIR="NexusInfinityAI"

# Define required directories
DIRECTORIES=(
    "backend/api/models"
    "backend/api/routers"
    "backend/lib"
    "backend/tests/integration"
    "backend/tests/unit"
    "config"
    "data"
    "datasets"
    "deployment/docker"
    "deployment/kubernetes"
    "deployment/local"
    "docs/ai_models"
    "docs/backend"
    "docs/deployment"
    "docs/frontend"
    "frontend/public"
    "frontend/src/app"
    "frontend/src/components"
    "frontend/src/hooks"
    "frontend/src/store"
    "frontend/src/types"
    "frontend/src/utils"
    "models"
    "nexus-core"
    "scripts"
)

# Define required files
declare -A FILES
FILES["data/logs.txt"]="# AI Execution Logs"
FILES["config/config.ini"]="[AI_Deployment]\nmode=auto\ntask_limit=100"
FILES["backend/api/routers/main.py"]='from fastapi import APIRouter\nrouter = APIRouter()'

# Function to create directories if missing
create_directories() {
    echo "📂 Ensuring all required directories exist..."
    for dir in "${DIRECTORIES[@]}"; do
        if [ ! -d "$BASE_DIR/$dir" ]; then
            echo "⚠️ Missing: $dir - Creating..."
            mkdir -p "$BASE_DIR/$dir"
        fi
    done
}

# Function to create required files if missing
create_files() {
    echo "📄 Ensuring required files exist..."
    for file in "${!FILES[@]}"; do
        if [ ! -f "$BASE_DIR/$file" ]; then
            echo "⚠️ Missing: $file - Creating..."
            echo -e "${FILES[$file]}" > "$BASE_DIR/$file"
        fi
    done
}

# Function to validate system health & auto-correct
system_check() {
    echo "🔍 Running AI system self-check..."
    for dir in "${DIRECTORIES[@]}"; do
        if [ ! -d "$BASE_DIR/$dir" ]; then
            echo "❌ ERROR: Missing directory: $dir"
        fi
    done
    for file in "${!FILES[@]}"; do
        if [ ! -f "$BASE_DIR/$file" ]; then
            echo "❌ ERROR: Missing file: $file"
        fi
    done
    echo "✅ AI system check completed successfully."
}

# Run functions
create_directories
create_files
system_check

echo "🎯 Project structure is now auto-corrected & balanced."
