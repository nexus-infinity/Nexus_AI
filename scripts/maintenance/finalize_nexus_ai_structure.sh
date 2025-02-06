#!/bin/bash

echo "🔧 Finalizing and cleaning up Nexus AI project structure..."

BASE_DIR=~/dev/nexus_ai

# Remove redundant or misplaced folders
echo "🗑️ Removing unnecessary directories..."
rm -rf $BASE_DIR/Dev
rm -rf $BASE_DIR/nexus_infinity/{core
rm -rf $BASE_DIR/nexus_infinity/{core/

# Move misplaced files to appropriate locations
echo "🚚 Organizing files into proper directories..."
mv $BASE_DIR/nexus_execution.log $BASE_DIR/logs/ 2>/dev/null
mv $BASE_DIR/LICENSE $BASE_DIR/docs/ 2>/dev/null
mv $BASE_DIR/README.md $BASE_DIR/docs/ 2>/dev/null

# Ensure necessary directories exist
echo "📂 Ensuring critical directories are properly set up..."
mkdir -p $BASE_DIR/{ai,backend,frontend,infrastructure,testing,docs,logs,scripts,projects,config}
mkdir -p $BASE_DIR/config/{environments,feature_flags,scaling_profiles}

# Display final structure
echo "✅ Final directory structure:"
tree $BASE_DIR -L 2

echo "🚀 Nexus AI project structure cleaned and finalized successfully!"
