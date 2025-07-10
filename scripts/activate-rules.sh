#!/bin/bash

# This script copies relevant rules from the bank to the active folder

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${YELLOW}Simplified Cline Rules Activation System${NC}"
echo "========================================"

# Check if we're in a project with clinerules-bank
if [ ! -d "clinerules-bank" ]; then
    echo -e "${RED}Error: clinerules-bank directory not found${NC}"
    echo "Please run this script from your project root"
    exit 1
fi

# Clear current active rules
echo -e "${BLUE}Clearing current active rules...${NC}"
rm -f .clinerules/*

# Always activate base rules (these apply to everything)
echo -e "${BLUE}Activating general coding standards...${NC}"
if [ -f "clinerules-bank/01-coding-standards.md" ]; then
    cp clinerules-bank/01-coding-standards.md .clinerules/
else
    echo -e "${RED}Warning: 01-coding-standards.md not found${NC}"
fi

# Activate environment-specific rules based on parameter
case "$1" in
    "go")
        echo -e "${BLUE}Activating Go development environment...${NC}"
        if [ -f "clinerules-bank/environments/go.md" ]; then
            cp clinerules-bank/environments/go.md .clinerules/
            echo -e "${GREEN}✓ Go environment rules activated${NC}"
        else
            echo -e "${RED}Warning: go.md not found in environments folder${NC}"
        fi
        ;;
    "python")
        echo -e "${BLUE}Activating Python development environment...${NC}"
        if [ -f "clinerules-bank/environments/python.md" ]; then
            cp clinerules-bank/environments/python.md .clinerules/
            echo -e "${GREEN}✓ Python environment rules activated${NC}"
        else
            echo -e "${RED}Warning: python.md not found in environments folder${NC}"
        fi
        ;;

    "both")
        echo -e "${BLUE}Activating both Go and Python environments...${NC}"
        if [ -f "clinerules-bank/environments/go.md" ]; then
            cp clinerules-bank/environments/go.md .clinerules/
            echo -e "${GREEN}✓ Go environment rules activated${NC}"
        else
            echo -e "${RED}Warning: go.md not found${NC}"
        fi
        if [ -f "clinerules-bank/environments/python.md" ]; then
            cp clinerules-bank/environments/python.md .clinerules/
            echo -e "${GREEN}✓ Python environment rules activated${NC}"
        else
            echo -e "${RED}Warning: python.md not found${NC}"
        fi
        ;;
    "status")
        echo -e "${BLUE}Current active rules:${NC}"
        if [ -d ".clinerules" ] && [ "$(ls -A .clinerules 2>/dev/null)" ]; then
            ls -la .clinerules/
        else
            echo "No active rules found"
        fi
        exit 0
        ;;
    "list")
        echo -e "${BLUE}Available rules in bank:${NC}"
        echo -e "${YELLOW}General:${NC}"
        ls -la clinerules-bank/*.md 2>/dev/null || echo "  No general rules found"
        echo -e "${YELLOW}Environments:${NC}"
        ls -la clinerules-bank/environments/*.md 2>/dev/null || echo "  No environment rules found"
        exit 0
        ;;
    *)
        echo -e "${RED}Usage: $0 {go|python|both|status|list}${NC}"
        echo ""
        echo -e "${YELLOW}Available commands:${NC}"
        echo "  go      - Activate Go development environment"
        echo "  python  - Activate Python development environment"
        echo "  both    - Activate both Go and Python environments"
        echo "  status  - Show currently active rules"
        echo "  list    - Show available rules in the bank"
        echo ""
        echo -e "${YELLOW}Examples:${NC}"
        echo "  $0 go      # For Go projects"
        echo "  $0 python  # For Python projects"
        echo "  $0 both    # For polyglot projects"
        exit 1
        ;;
esac

# Show what's now active
echo ""
echo -e "${GREEN}Currently active rules:${NC}"
if [ -d ".clinerules" ] && [ "$(ls -A .clinerules 2>/dev/null)" ]; then
    ls -la .clinerules/ | grep -v "^total"
else
    echo "No rules activated"
fi

echo ""
echo -e "${GREEN}Rules activated successfully for: $1${NC}"
echo -e "${BLUE}You can now start Cline and it will use these rules${NC}"