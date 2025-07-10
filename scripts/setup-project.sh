#!/bin/bash
# File: scripts/setup-project.sh
# Purpose: Set up complete Cline infrastructure in the current project



set -e

echo "Setting up Cline infrastructure in current project..."

# Get the directory where this script is located (CLINE-SETUP repo)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SETUP_REPO_DIR="$(dirname "$SCRIPT_DIR")"

# Current project directory (where script is being run from)
PROJECT_DIR="$(pwd)"

echo "Creating directory structure..."
mkdir -p .clinerules
mkdir -p clinerules-bank/environments
mkdir -p memory-bank
mkdir -p scripts
mkdir -p workflows/development

echo "Copying core clinerules files..."
cp "$SETUP_REPO_DIR/.clinerules/01-coding-standards.md" .clinerules/
cp "$SETUP_REPO_DIR/.clinerules/initializememorybank.md" .clinerules/
echo "Copying clinerules-bank structure..."
cp "$SETUP_REPO_DIR/clinerules-bank/01-coding-standards.md" clinerules-bank/
# Copy environments directory structure (but not specific language files)
mkdir -p clinerules-bank/environments

echo "Copying memory-bank templates..."
cp "$SETUP_REPO_DIR/memory-bank/activeContext.md" memory-bank/
cp "$SETUP_REPO_DIR/memory-bank/productContext.md" memory-bank/
cp "$SETUP_REPO_DIR/memory-bank/progress.md" memory-bank/
cp "$SETUP_REPO_DIR/memory-bank/projectbrief.md" memory-bank/
cp "$SETUP_REPO_DIR/memory-bank/systemPatterns.md" memory-bank/
cp "$SETUP_REPO_DIR/memory-bank/techContext.md" memory-bank/

echo "Copying scripts..."
cp "$SETUP_REPO_DIR/scripts/activate-rules.sh" scripts/
chmod +x scripts/activate-rules.sh

echo "Copying workflows..."
cp "$SETUP_REPO_DIR/workflows/development/setup-project.md" workflows/development/

echo "Initializing project context..."
PROJECT_NAME=$(basename "$PROJECT_DIR")
echo "# Project: $PROJECT_NAME" >> memory-bank/projectbrief.md
echo "- Cline infrastructure setup completed: $(date)" >> memory-bank/progress.md
echo "- Basic Cline setup activated" >> memory-bank/activeContext.md

echo "Activating rules..."
./scripts/activate-rules.sh 

echo "Cline infrastructure setup completed successfully!"
echo ""
echo "Your Cline setup is now ready:"
echo "   - .clinerules/ - Active rules for this project"
echo "   - clinerules-bank/ - Rule templates and environments"
echo "   - memory-bank/ - Project context and memory files"
echo "   - scripts/ - Cline management scripts"
echo "   - workflows/ - Development workflows"
echo ""
echo "You can now delete the CLINE-SETUP directory if desired:"
echo "   rm -rf CLINE-SETUP"