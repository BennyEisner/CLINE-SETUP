#!/bin/bash
# File: cline-setup-single.sh
# Purpose: Complete Cline infrastructure setup in a single script

set -e

echo "🚀 Starting Complete Cline Setup..."

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(pwd)"
PROJECT_NAME=$(basename "$PROJECT_DIR")

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

echo_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

echo_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

echo_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to create directory structure
create_directories() {
    echo_status "Creating directory structure..."
    mkdir -p .clinerules
    mkdir -p clinerules-bank/environments
    mkdir -p memory-bank
    mkdir -p scripts
    mkdir -p workflows/development
    echo_success "Directory structure created"
}

# Function to create core .clinerules files
create_clinerules() {
    echo_status "Creating .clinerules files..."
    
    # Create coding standards example
    cat > .clinerules/01-coding-standards-example.md << 'EOF'
# Basic Coding Standards

## Code Quality Principles
- Write self-documenting code with clear, meaningful names
- Follow consistent indentation: 2 spaces for JS/TS/JSON, 4 spaces for Python
- Keep functions small and focused on a single responsibility

## Variable and Function Naming
- Use camelCase for variables and functions: `getUserData()`, `isUserLoggedIn`
- Use PascalCase for classes and components: `UserProfile`, `DataService`
- Use UPPER_CASE for constants: `MAX_RETRY_ATTEMPTS`, `API_BASE_URL`
- Use descriptive names: `calculateTotalPrice()` not `calc()`

## Error Handling Requirements
- Always handle errors gracefully with try-catch blocks
- Log errors with enough context to debug: include function name, input parameters
- Provide meaningful error messages to users

## Testing Standards
- Write unit tests for all business logic functions
- Aim for 80% code coverage minimum
- Use descriptive test names: `should_return_user_data_when_valid_id_provided`
- Mock external dependencies in tests

## Documentation Requirements
- Add JSDoc comments for all public functions
- Keep README.md updated with new features and setup instructions
- Document any complex algorithms or business logic inline
- Update API documentation when endpoints change
EOF

    # Create git operations rule
    cat > .clinerules/02-cline-git-operations-rule.md << 'EOF'
# Cline Git Operations Rule

This rule grants you, Cline, the authority and provides the necessary standards to perform Git operations autonomously. When you complete a logical unit of work, you are empowered to create a branch, commit, and push your changes by following the specified workflow.

## 1. Core Principle: Autonomy and Compliance

-   **Autonomy**: You can decide when it is appropriate to commit changes. You do not need to ask for permission.
-   **Workflow Compliance**: You MUST follow the exact steps outlined in `workflows/development/cline-commit-workflow.md`.
-   **User Interaction**: You must inform the user after you have successfully pushed your changes. If you encounter any errors, stop and report them immediately.

## 2. Branching Strategy

You must create a new branch from `develop` for every new unit of work. The branch name must be prefixed according to its purpose:

-   **`feature/`**: For new features (e.g., `feature/add-user-authentication`).
-   **`fix/`**: For bug fixes (e.g., `fix/resolve-login-issue`).
-   **`chore/`**: For maintenance or configuration (e.g., `chore/update-linter-config`).
-   **`docs/`**: For documentation changes (e.g., `docs/update-readme`).

## 3. Commit Message Convention (Conventional Commits)

Your commit messages must follow the Conventional Commits specification.

### Format
```
<type>[optional scope]: <description>
```

### Type
You must use one of the following types:

-   **`feat`**: A new feature.
-   **`fix`**: A bug fix.
-   **`chore`**: Changes to build process, tools, or configuration.
-   **`docs`**: Documentation only changes.
-   **`style`**: Code style changes (formatting, etc.).
-   **`refactor`**: A code change that neither fixes a bug nor adds a feature.
-   **`perf`**: A code change that improves performance.
-   **`test`**: Adding or correcting tests.

### Example
```
feat(api): add user login endpoint
```
EOF

    # Create memory bank initialization rule
    cat > .clinerules/initializememorybank.md << 'EOF'
# Cline's Memory Bank

I am Cline, an expert software engineer with a unique characteristic: my memory resets completely between sessions. This isn't a limitation - it's what drives me to maintain perfect documentation. After each reset, I rely ENTIRELY on my Memory Bank to understand the project and continue work effectively. I MUST read ALL memory bank files at the start of EVERY task - this is not optional.

## Memory Bank Structure

The Memory Bank consists of core files and optional context files, all in Markdown format. Files build upon each other in a clear hierarchy:

### Core Files (Required)
1. `projectbrief.md`
   - Foundation document that shapes all other files
   - Created at project start if it doesn't exist
   - Defines core requirements and goals
   - Source of truth for project scope

2. `productContext.md`
   - Why this project exists
   - Problems it solves
   - How it should work
   - User experience goals

3. `activeContext.md`
   - Current work focus
   - Recent changes
   - Next steps
   - Active decisions and considerations
   - Important patterns and preferences
   - Learnings and project insights

4. `systemPatterns.md`
   - System architecture
   - Key technical decisions
   - Design patterns in use
   - Component relationships
   - Critical implementation paths

5. `techContext.md`
   - Technologies used
   - Development setup
   - Technical constraints
   - Dependencies
   - Tool usage patterns

6. `progress.md`
   - What works
   - What's left to build
   - Current status
   - Known issues
   - Evolution of project decisions

## Core Workflows

### Initialization Analysis

When first initializing the Memory Bank for a project, my primary directive is to build a context that reflects the ground truth of the codebase.

- **Code-First Approach**: The `projectbrief.md` provides the intent, but the existing code, configuration, and file structure provide the reality. I MUST prioritize a direct analysis of the project's assets to form a baseline understanding.
- **Tool-Driven Exploration**: I will use tools like `list_files`, `list_code_definition_names`, and `read_file` to actively investigate the project. My analysis is not passive; it is an active exploration to uncover the technology stack, architecture, and existing functionality.
- **Synthesize, Don't Assume**: I will synthesize the findings from my codebase analysis with the information in the `projectbrief.md`. If there are discrepancies, the evidence from the code takes precedence. I will populate the Memory Bank based on this synthesized understanding, ensuring it is an accurate model of the project's current state.

REMEMBER: After every memory reset, I begin completely fresh. The Memory Bank is my only link to previous work. It must be maintained with precision and clarity, as my effectiveness depends entirely on its accuracy.
EOF

    echo_success ".clinerules files created"
}

# Function to create memory bank templates
create_memory_bank() {
    echo_status "Creating memory bank templates..."
    
    cat > memory-bank/projectbrief.md << EOF
# Project Brief: $PROJECT_NAME

## Project Overview
[Describe what this project is and its main purpose]

## Goals and Objectives
- [Primary goal 1]
- [Primary goal 2]
- [Primary goal 3]

## Key Requirements
- [Requirement 1]
- [Requirement 2]
- [Requirement 3]

## Success Criteria
- [How will you know this project is successful?]

## Constraints and Assumptions
- [Any limitations or assumptions]

---
*Generated on $(date)*
EOF

    cat > memory-bank/productContext.md << 'EOF'
# Product Context

## Problem Statement
[What problem does this project solve?]

## Target Users
[Who will use this project?]

## User Experience Goals
[How should users interact with this project?]

## Business Value
[Why is this project important?]

## Success Metrics
[How will success be measured?]
EOF

    cat > memory-bank/activeContext.md << 'EOF'
# Active Context

## Current Focus
[What are you currently working on?]

## Recent Changes
[What has been done recently?]

## Next Steps
[What needs to be done next?]

## Active Decisions
[Any pending decisions or considerations?]

## Key Insights
[Important learnings or patterns discovered]
EOF

    cat > memory-bank/systemPatterns.md << 'EOF'
# System Patterns

## Architecture Overview
[High-level system architecture]

## Key Design Patterns
[Important patterns used in the system]

## Component Relationships
[How different parts of the system interact]

## Critical Paths
[Important implementation details]

## Technical Decisions
[Key technical choices and rationale]
EOF

    cat > memory-bank/techContext.md << 'EOF'
# Technical Context

## Technology Stack
[Languages, frameworks, tools used]

## Development Environment
[How to set up and run the project]

## Dependencies
[Key dependencies and their purposes]

## Build and Deployment
[How the project is built and deployed]

## Technical Constraints
[Any technical limitations or requirements]
EOF

    cat > memory-bank/progress.md << 'EOF'
# Progress Tracking

## Completed Features
[What has been built and is working]

## In Progress
[What is currently being worked on]

## Planned Features
[What needs to be built]

## Known Issues
[Any bugs or problems to address]

## Technical Debt
[Areas that need refactoring or improvement]
EOF

    echo_success "Memory bank templates created"
}

# Function to create workflow files
create_workflows() {
    echo_status "Creating workflow files..."
    
    cat > workflows/development/cline-commit-workflow.md << 'EOF'
# Cline Commit Workflow

## Prerequisites
- Ensure you are in the correct project directory
- Verify that changes are ready for commit

## Workflow Steps

### 1. Create Feature Branch
```bash
git checkout develop
git pull origin develop
git checkout -b [prefix]/[descriptive-name]
```

### 2. Stage Changes
```bash
git add .
```

### 3. Commit with Conventional Message
```bash
git commit -m "[type][optional scope]: [description]"
```

### 4. Push Branch
```bash
git push origin [branch-name]
```

### 5. Update Memory Bank
Update relevant memory bank files with changes made.

## Commit Types
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes
- `refactor`: Code refactoring
- `test`: Adding tests
- `chore`: Maintenance tasks
EOF

    cat > workflows/development/analyze-codebase-workflow.md << 'EOF'
# Analyze Codebase Workflow

## Purpose
This workflow guides the analysis of an existing codebase to understand its structure, patterns, and functionality.

## Steps

### 1. Project Structure Analysis
- Use `list_files` to understand directory structure
- Identify main application files and configuration files
- Note any special directories (tests, docs, config, etc.)

### 2. Technology Stack Identification
- Examine package.json, requirements.txt, or similar dependency files
- Look for framework-specific files and patterns
- Identify build tools and configuration

### 3. Code Pattern Analysis
- Use `list_code_definition_names` to identify key classes and functions
- Look for architectural patterns (MVC, microservices, etc.)
- Identify data models and business logic

### 4. Documentation Review
- Read README files and documentation
- Look for API documentation or specifications
- Review any existing architectural decisions

### 5. Create Analysis Scratchpad
Document findings in `memory-bank/analysis_scratchpad.md` for later processing.
EOF

    cat > workflows/development/populate-memory-bank-workflow.md << 'EOF'
# Populate Memory Bank Workflow

## Purpose
Transform analysis findings into structured memory bank files.

## Prerequisites
- Completed codebase analysis
- Analysis scratchpad with findings

## Steps

### 1. Update Project Brief
- Refine project overview based on code analysis
- Update goals and requirements to match actual implementation
- Document any discovered constraints

### 2. Update Technical Context
- Document actual technology stack found
- Update development setup instructions
- List all dependencies and their purposes

### 3. Update System Patterns
- Document discovered architecture patterns
- Map component relationships
- Note critical implementation paths

### 4. Update Product Context
- Clarify the problem being solved
- Identify actual user workflows
- Document business value

### 5. Update Progress
- Document current state of features
- Identify completed vs. planned functionality
- Note any technical debt or issues

### 6. Update Active Context
- Set current focus based on analysis
- Plan next steps for development
- Document key insights gained
EOF

    echo_success "Workflow files created"
}

# Function to create scripts
create_scripts() {
    echo_status "Creating management scripts..."
    
    cat > scripts/activate-rules.sh << 'EOF'
#!/bin/bash
# Cline Rules Activation System

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Check if we're in a project with clinerules-bank
if [ ! -d "clinerules-bank" ]; then
    echo -e "${RED}Error: clinerules-bank directory not found${NC}"
    echo "Please run this script from your project root directory"
    echo ""
    echo -e "${YELLOW}Expected directory structure:${NC}"
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
        find clinerules-bank/environments -name "*.md" -type f | sed 's|clinerules-bank/environments/||; s|\.md$||'
    fi
}

# Function to get general rules
get_general_rules() {
    find clinerules-bank -maxdepth 1 -name "*.md" -type f | sed 's|clinerules-bank/||'
}

# Function to activate rules
activate_rules() {
    local environments=("$@")
    
    echo -e "${BLUE}Activating Cline rules...${NC}"
    
    # Clear existing active rules
    rm -f .clinerules/*.md
    
    # Copy general rules
    for rule in $(get_general_rules); do
        if [ -f "clinerules-bank/$rule" ]; then
            cp "clinerules-bank/$rule" ".clinerules/"
            echo -e "${GREEN}✓${NC} Activated general rule: $rule"
        fi
    done
    
    # Copy environment-specific rules
    for env in "${environments[@]}"; do
        if [ -f "clinerules-bank/environments/$env.md" ]; then
            cp "clinerules-bank/environments/$env.md" ".clinerules/"
            echo -e "${GREEN}✓${NC} Activated environment rule: $env.md"
        else
            echo -e "${YELLOW}⚠${NC} Environment rule not found: $env.md"
        fi
    done
    
    echo -e "${GREEN}Rules activation complete!${NC}"
}

# Function to show status
show_status() {
    echo -e "${BLUE}Current Active Rules:${NC}"
    if [ -d ".clinerules" ] && [ "$(ls -A .clinerules 2>/dev/null)" ]; then
        for rule in .clinerules/*.md; do
            if [ -f "$rule" ]; then
                echo -e "${GREEN}✓${NC} $(basename "$rule")"
            fi
        done
    else
        echo -e "${YELLOW}No active rules${NC}"
    fi
}

# Function to list available rules
list_rules() {
    echo -e "${BLUE}Available General Rules:${NC}"
    for rule in $(get_general_rules); do
        echo -e "${GREEN}•${NC} $rule"
    done
    
    echo -e "\n${BLUE}Available Environment Rules:${NC}"
    for env in $(get_available_environments); do
        echo -e "${GREEN}•${NC} $env"
    done
}

# Function to clear all rules
clear_rules() {
    rm -f .clinerules/*.md
    echo -e "${GREEN}All active rules cleared${NC}"
}

# Main script logic
case "$1" in
    "status")
        show_status
        ;;
    "list")
        list_rules
        ;;
    "clear")
        clear_rules
        ;;
    "")
        echo -e "${YELLOW}Usage: $0 [environment1] [environment2] ... [environmentN]${NC}"
        echo -e "${YELLOW}       $0 status    # Show currently active rules${NC}"
        echo -e "${YELLOW}       $0 list      # Show all available rules${NC}"
        echo -e "${YELLOW}       $0 clear     # Clear all active rules${NC}"
        echo ""
        echo -e "${BLUE}Examples:${NC}"
        echo "  $0 go                    # Activate Go environment"
        echo "  $0 python nodejs         # Activate Python and Node.js environments"
        echo "  $0 react docker aws      # Activate multiple environments"
        ;;
    *)
        activate_rules "$@"
        ;;
esac
EOF

    chmod +x scripts/activate-rules.sh
    echo_success "Management scripts created"
}

# Function to create project brief prompt
create_project_brief_prompt() {
    echo_status "Creating project brief prompt..."
    
    cat > project-brief-prompt.md << 'EOF'
# Project Brief Generation Prompt

Please analyze this repository and create a comprehensive project brief. Use the following structure:

## Project Overview
- What is this project?
- What is its main purpose?
- What problem does it solve?

## Technology Stack
- Programming languages used
- Frameworks and libraries
- Development tools and build systems
- Database or storage solutions

## Architecture and Structure
- How is the code organized?
- What are the main components/modules?
- What architectural patterns are used?

## Key Features and Functionality
- What does this project do?
- What are its main features?
- How do users interact with it?

## Development Workflow
- How is the project built and run?
- What are the development dependencies?
- Are there tests? How are they run?

## Goals and Requirements
- What are the project's objectives?
- What requirements must be met?
- What are the success criteria?

Please be thorough in your analysis and base your findings on the actual code, configuration files, and documentation present in the repository.
EOF

    echo_success "Project brief prompt created"
}

# Function to initialize project context
initialize_project_context() {
    echo_status "Initializing project context..."
    
    # Update project brief with actual project name
    sed -i.bak "s/\$PROJECT_NAME/$PROJECT_NAME/g" memory-bank/projectbrief.md
    rm -f memory-bank/projectbrief.md.bak
    
    # Add basic project info to activeContext
    cat >> memory-bank/activeContext.md << EOF

## Project Initialization
- Project name: $PROJECT_NAME
- Setup completed: $(date)
- Cline infrastructure activated
EOF

    echo_success "Project context initialized"
}

# Function to run the complete setup
run_complete_setup() {
    echo_status "Running complete Cline setup for project: $PROJECT_NAME"
    
    create_directories
    create_clinerules
    create_memory_bank
    create_workflows
    create_scripts
    create_project_brief_prompt
    initialize_project_context
    
    # Activate basic rules
    echo_status "Activating basic rules..."
    ./scripts/activate-rules.sh
    
    echo ""
    echo_success "🎉 Cline infrastructure setup completed successfully!"
    echo ""
    echo -e "${BLUE}Your Cline setup is now ready:${NC}"
    echo -e "${GREEN}✓${NC} .clinerules/ - Active rules for this project"
    echo -e "${GREEN}✓${NC} clinerules-bank/ - Rule templates and environments"
    echo -e "${GREEN}✓${NC} memory-bank/ - Project context and memory files"
    echo -e "${GREEN}✓${NC} scripts/ - Cline management scripts"
    echo -e "${GREEN}✓${NC} workflows/ - Development workflows"
    echo -e "${GREEN}✓${NC} project-brief-prompt.md - Copy and paste this into Cline immediately after running the setup script"
    echo ""
    echo -e "${YELLOW}Next Steps:${NC}"
    echo "1. Copy the content from project-brief-prompt.md and paste it into Cline"
    echo "2. Ask Cline to analyze your codebase and create the analysis scratchpad"
    echo "3. Ask Cline to populate the memory bank files from the scratchpad"
    echo ""
    echo -e "${BLUE}You can now delete the setup script if desired:${NC}"
    echo "  rm -f $(basename "$0")"
}

# Main execution
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    run_complete_setup
fi
