#!/bin/bash

# Cline Rules Activation System
# =============================
# This script manages the activation of Cline rules from the rules bank to the active rules directory.
# It dynamically discovers available environments and allows flexible rule activation.
#
# DIRECTORY STRUCTURE:
# Your project should have:
# - clinerules-bank/              # Rule templates and environments
#   - *.md                        # General rules (always available)
#   - environments/               # Environment-specific rules
#     - environment1.md          # Rules for environment1
#     - environment2.md          # Rules for environment2
#     - ...
# - .clinerules/                 # Active rules directory (what Cline reads)
#
# HOW TO ADD NEW ENVIRONMENTS:
# 1. Create a new .md file in clinerules-bank/environments/
# 2. Name it descriptively (e.g., react.md, nodejs.md, docker.md)
# 3. The script will automatically discover it
# 4. Use the filename (without .md) as the environment name
#
# EXAMPLES:
# - Add clinerules-bank/environments/react.md → activate with: ./activate-rules.sh react
# - Add clinerules-bank/environments/nodejs.md → activate with: ./activate-rules.sh nodejs
# - Add clinerules-bank/environments/docker.md → activate with: ./activate-rules.sh docker
#
# USAGE:
# ./activate-rules.sh [environment1] [environment2] ... [environmentN]
# ./activate-rules.sh status    # Show currently active rules
# ./activate-rules.sh list      # Show all available rules
# ./activate-rules.sh clear     # Clear all active rules
#
# EXAMPLES:
# ./activate-rules.sh go                    # Activate Go environment
# ./activate-rules.sh python nodejs         # Activate Python and Node.js environments
# ./activate-rules.sh react docker aws      # Activate multiple environments
# ./activate-rules.sh status                # Show what's currently active
# ./activate-rules.sh list                  # Show all available environments




# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${YELLOW}Cline Rules Activation System${NC}"
echo "============================="

# Check if we're in a project with clinerules-bank
if [ ! -d "clinerules-bank" ]; then
    echo -e "${RED}Error: clinerules-bank directory not found${NC}"
    echo "Please run this script from your project root directory"
    echo ""
    echo -e "${CYAN}Expected directory structure:${NC}"
    echo "  clinerules-bank/"
    echo "  ├── *.md                    # General rules"
    echo "  └── environments/"
    echo "      ├── environment1.md     # Environment-specific rules"
    echo "      └── environment2.md"
    echo ""
    exit 1
fi

# Function to get available environments
get_available_environments() {
    if [ -d "clinerules-bank/environments" ]; then
        find clinerules-bank/environments -name "*.md" -type f | sed 's|clinerules-bank/environments/||; s|\.md$||' | sort
    fi
}

# Function to get general rules
get_general_rules() {
    find clinerules-bank -maxdepth 1 -name "*.md" -type f | sed 's|clinerules-bank/||' | sort
}

# Function to show usage
show_usage() {
    echo -e "${RED}Usage: $0 [environment1] [environment2] ... | {status|list|clear}${NC}"
    echo ""
    echo -e "${YELLOW}Commands:${NC}"
    echo "  [environment]  - Activate one or more environments"
    echo "  status         - Show currently active rules"
    echo "  list           - Show available rules and environments"
    echo "  clear          - Clear all active rules"
    echo ""
    
    local available_envs=$(get_available_environments)
    if [ -n "$available_envs" ]; then
        echo -e "${YELLOW}Available environments:${NC}"
        echo "$available_envs" | sed 's/^/  /'
        echo ""
    fi
    
    echo -e "${YELLOW}Examples:${NC}"
    if [ -n "$available_envs" ]; then
        local first_env=$(echo "$available_envs" | head -1)
        local second_env=$(echo "$available_envs" | head -2 | tail -1)
        echo "  $0 $first_env                    # Activate single environment"
        if [ "$first_env" != "$second_env" ]; then
            echo "  $0 $first_env $second_env        # Activate multiple environments"
        fi
    fi
    echo "  $0 status                        # Show active rules"
    echo "  $0 list                          # Show all available rules"
}

# Handle special commands
case "$1" in
    "status")
        echo -e "${BLUE}Currently active rules:${NC}"
        if [ -d ".clinerules" ] && [ "$(ls -A .clinerules 2>/dev/null)" ]; then
            ls -la .clinerules/ | grep -v "^total" | while read line; do
                echo "  $line"
            done
        else
            echo "  No active rules found"
        fi
        exit 0
        ;;
    "list")
        echo -e "${BLUE}Available rules in bank:${NC}"
        echo ""
        
        local general_rules=$(get_general_rules)
        if [ -n "$general_rules" ]; then
            echo -e "${YELLOW}General rules (always activated):${NC}"
            echo "$general_rules" | sed 's/^/  /'
            echo ""
        fi
        
        local available_envs=$(get_available_environments)
        if [ -n "$available_envs" ]; then
            echo -e "${YELLOW}Available environments:${NC}"
            echo "$available_envs" | sed 's/^/  /'
            echo ""
        else
            echo -e "${YELLOW}No environments found${NC}"
            echo "  Add .md files to clinerules-bank/environments/ to create environments"
            echo ""
        fi
        exit 0
        ;;
    "clear")
        echo -e "${BLUE}Clearing all active rules...${NC}"
        rm -f .clinerules/*
        echo -e "${GREEN}✓ All active rules cleared${NC}"
        exit 0
        ;;
    "")
        # No environment specified, proceed to activate general rules
        ;;
    *)
        # Continue with environment activation
        ;;
esac

# Create .clinerules directory if it doesn't exist
mkdir -p .clinerules

# Clear current active rules
echo -e "${BLUE}Clearing current active rules...${NC}"
rm -f .clinerules/*

# Always activate general rules (these apply to everything)
echo -e "${BLUE}Activating general rules...${NC}"
general_rules=$(get_general_rules)
if [ -n "$general_rules" ]; then
    while IFS= read -r rule; do
        if [ -f "clinerules-bank/$rule" ]; then
            cp "clinerules-bank/$rule" .clinerules/
            echo -e "${GREEN}✓ Activated: $rule${NC}"
        fi
    done <<< "$general_rules"
else
    echo -e "${YELLOW}No general rules found${NC}"
fi

# Get available environments
available_envs=$(get_available_environments)

# Process each environment argument
activated_envs=()
for env in "$@"; do
    if echo "$available_envs" | grep -q "^$env$"; then
        echo -e "${BLUE}Activating $env environment...${NC}"
        if [ -f "clinerules-bank/environments/$env.md" ]; then
            cp "clinerules-bank/environments/$env.md" .clinerules/
            echo -e "${GREEN}✓ $env environment rules activated${NC}"
            activated_envs+=("$env")
        else
            echo -e "${RED}Warning: $env.md not found in environments folder${NC}"
        fi
    else
        echo -e "${RED}Error: Unknown environment '$env'${NC}"
        echo -e "${YELLOW}Available environments:${NC}"
        if [ -n "$available_envs" ]; then
            echo "$available_envs" | sed 's/^/  /'
        else
            echo "  No environments available"
            echo "  Add .md files to clinerules-bank/environments/ to create environments"
        fi
        exit 1
    fi
done

# Show what's now active
echo ""
echo -e "${GREEN}Currently active rules:${NC}"
if [ -d ".clinerules" ] && [ "$(ls -A .clinerules 2>/dev/null)" ]; then
    ls -la .clinerules/ | grep -v "^total" | while read line; do
        echo "  $line"
    done
else
    echo "  No rules activated"
fi

echo ""
if [ ${#activated_envs[@]} -gt 0 ]; then
    echo -e "${GREEN}Successfully activated environments: ${activated_envs[*]}${NC}"
else
    echo -e "${GREEN}General rules activated${NC}"
fi
echo -e "${BLUE}You can now start Cline and it will use these rules${NC}"
echo ""
echo -e "${CYAN}Tip: Run '$0 status' to see active rules anytime${NC}"
