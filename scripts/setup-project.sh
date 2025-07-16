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
rsync -a --ignore-existing "$SETUP_REPO_DIR/.clinerules/" .clinerules/
echo "Copying clinerules-bank structure..."
rsync -a --ignore-existing "$SETUP_REPO_DIR/clinerules-bank/" clinerules-bank/
echo "Ensuring initializememorybank.md is in the rule bank..."
rsync -a --ignore-existing "$SETUP_REPO_DIR/.clinerules/initializememorybank.md" clinerules-bank/
mkdir -p clinerules-bank/environments

echo "Copying memory-bank templates..."
rsync -a --ignore-existing "$SETUP_REPO_DIR/memory-bank/" memory-bank/

echo "Copying scripts..."
rsync -a --ignore-existing "$SETUP_REPO_DIR/scripts/" scripts/
chmod +x scripts/activate-rules.sh

echo "Copying workflows..."
rsync -a --ignore-existing "$SETUP_REPO_DIR/workflows/" workflows/

echo "Copying project brief prompt..."
rsync -a --ignore-existing "$SETUP_REPO_DIR/project-brief-prompt.md" "$PROJECT_DIR/"

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
echo "   - project-brief-prompt.md - copy in paste this into cline immediately after running the setup script"
echo ""
echo "You can now delete the CLINE-SETUP directory if desired:"
echo "   rm -rf CLINE-SETUP"
