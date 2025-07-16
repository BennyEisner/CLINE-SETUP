#!/bin/bash
# File: scripts/setup-project.sh
# Purpose: Set up complete Cline infrastructure in the current project using local files.

set -e

echo "Setting up Cline infrastructure in current project..."

# Get the directory where this script is located to find the root of the Cline-Setup repo.
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SETUP_REPO_DIR="$(dirname "$SCRIPT_DIR")"

# The project directory is the current directory where the script is being run from.
PROJECT_DIR="$(pwd)"

echo "Creating directory structure..."
mkdir -p .clinerules
mkdir -p clinerules-bank/environments
mkdir -p memory-bank
mkdir -p scripts
mkdir -p workflows/development

echo "Copying core .clinerules files..."
# The '.' after the source path ensures the *contents* of the directory are copied.
cp -r "$SETUP_REPO_DIR/.clinerules/." .clinerules/

echo "Copying clinerules-bank structure..."
cp -r "$SETUP_REPO_DIR/clinerules-bank/." clinerules-bank/

echo "Ensuring initializememorybank.md is in the rule bank for activation..."
# This file must be in the bank so that activate-rules.sh can find it.
cp "$SETUP_REPO_DIR/.clinerules/initializememorybank.md" clinerules-bank/

echo "Copying memory-bank templates..."
cp -r "$SETUP_REPO_DIR/memory-bank/." memory-bank/

echo "Copying scripts..."
cp -r "$SETUP_REPO_DIR/scripts/." scripts/
chmod +x scripts/activate-rules.sh

echo "Copying workflows..."
cp -r "$SETUP_REPO_DIR/workflows/." workflows/

echo "Copying project brief prompt..."
cp "$SETUP_REPO_DIR/project-brief-prompt.md" "$PROJECT_DIR/"

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
