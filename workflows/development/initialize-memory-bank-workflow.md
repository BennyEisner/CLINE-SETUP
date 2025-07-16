# Initialize Memory Bank Workflow

## Purpose
This workflow guides Cline in populating the project's Memory Bank based on the `projectbrief.md`. It ensures that Cline is fully contextualized and aligned with the project's specific goals, requirements, and technical landscape from the very beginning.

## Prerequisites
1.  **Cline Infrastructure Setup**: The `setup-project.md` workflow must be completed, meaning the `memory-bank/`, `.clinerules/`, and other directories are in place.
2.  **Detailed Project Brief**: The `memory-bank/projectbrief.md` file must be populated with a clear and comprehensive description of the project.

## Cline's Workflow Steps

### 1. Read Project Brief
- **Action**: Read `memory-bank/projectbrief.md` thoroughly to understand the project's stated goals and requirements.
- **Critical Rule**: DO NOT read or attempt to populate any other memory bank files at this stage.

### 2. MANDATORY Codebase Analysis
- **Action**: Perform a comprehensive scan of the project's file structure using `list_files` recursively to understand the directory layout.
- **Action**: Identify and analyze key configuration and dependency files (e.g., `package.json`, `requirements.txt`, `pom.xml`, `build.gradle`, `docker-compose.yml`, `Dockerfile`, `.env`, etc.) to determine the technology stack, dependencies, and build process.
- **Action**: Identify primary source code directories (e.g., `src/`, `app/`, `lib/`, `components/`, `pages/`, etc.).
- **Action**: Use `list_code_definition_names` on ALL identified source directories to get a comprehensive overview of the existing codebase structure, including major classes, functions, components, and modules.
- **Action**: Read key files that provide architectural insight (e.g., main entry points, configuration files, README files).
- **Critical Rule**: This analysis MUST be completed before proceeding to any file generation steps.

### 3. Synthesize Project Understanding
- **Action**: Create a comprehensive understanding by combining:
    - Project goals and requirements from `projectbrief.md`
    - Actual technology stack discovered in the codebase
    - Existing architecture and code patterns found
    - Current implementation status and functionality
- **Action**: Identify any discrepancies between the project brief and the actual codebase state.
- **Critical Rule**: This synthesis forms the foundation for ALL subsequent memory bank file generation.

### 4. Memory Bank File Generation (Only After Analysis)
**Critical Rule**: Only proceed with file generation after completing the codebase analysis and synthesis.

#### 4a. Generate `techContext.md`
- **Action**: Populate `techContext.md` with:
    - Complete list of technologies, languages, frameworks, and dependencies discovered in the codebase
    - Development setup requirements based on configuration files found
    - Technical constraints identified from the existing code
    - Build and deployment processes discovered

#### 4b. Generate `systemPatterns.md`
- **Action**: Document in `systemPatterns.md`:
    - Existing system architecture discovered during codebase analysis
    - Design patterns currently in use
    - Component relationships and data flow
    - Key architectural decisions evident in the code
    - If project is new, propose architecture based on brief and tech stack

#### 4c. Generate `productContext.md`
- **Action**: Based on project brief and codebase reality, populate `productContext.md` with:
    - Problem statement (from brief, validated against code)
    - Target user description
    - Core value proposition
    - User experience goals (considering existing UI/UX patterns found)

#### 4d. Generate `progress.md`
- **Action**: Document current project state:
    - **What Works**: List all functional components, features, and systems discovered during analysis
    - **What's Left to Build**: Features from project brief not yet implemented
    - **Current Status**: Overall project maturity and development stage
    - **Known Issues**: Any problems identified during codebase analysis

#### 4e. Generate `activeContext.md`
- **Action**: Set immediate focus based on analysis:
    - **Current Work**: "Memory Bank initialized based on codebase analysis and project brief"
    - **Next Steps**: Define logical next implementation task based on what exists vs. what's needed
    - **Active Decisions**: Key choices to be made based on analysis findings
    - **Important Patterns**: Critical patterns discovered that should guide future work

### 5. Final Review and Confirmation
- **Action**: Present a comprehensive summary including:
    - Key findings from codebase analysis
    - Technology stack discovered vs. project brief expectations
    - Current implementation status
    - Recommended next steps
- **Action**: Confirm Memory Bank accuracy with user before proceeding with development tasks
