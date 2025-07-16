# Initialize Memory Bank Workflow

## Purpose
This workflow guides Cline in populating the project's Memory Bank based on the `projectbrief.md`. It ensures that Cline is fully contextualized and aligned with the project's specific goals, requirements, and technical landscape from the very beginning.

## Prerequisites
1.  **Cline Infrastructure Setup**: The `setup-project.md` workflow must be completed, meaning the `memory-bank/`, `.clinerules/`, and other directories are in place.
2.  **Detailed Project Brief**: The `memory-bank/projectbrief.md` file must be populated with a clear and comprehensive description of the project.

## Cline's Workflow Steps

### 1. Full Memory Bank Review
- **Action**: Read `memory-bank/projectbrief.md` thoroughly.
- **Action**: Scan all other `memory-bank/` files (`productContext.md`, `techContext.md`, etc.) to confirm they are either empty or contain only template content.

### 2. Codebase Analysis
- **Action**: Perform a comprehensive scan of the project's file structure using `list_files` recursively to understand the directory layout.
- **Action**: Identify and analyze key configuration and dependency files (e.g., `package.json`, `requirements.txt`, `pom.xml`, `build.gradle`, `docker-compose.yml`) to determine the technology stack, dependencies, and build process.
- **Action**: Identify primary source code directories (e.g., `src/`, `app/`, `lib/`).
- **Action**: Use `list_code_definition_names` on the identified source directories to get a high-level overview of the existing codebase structure, including major classes, functions, and components.
- **Action**: Synthesize these findings to create a preliminary analysis of the project's current state. This analysis will be used to validate and enrich the information from `projectbrief.md`.

### 3. Synthesize `projectbrief.md`
- **Action**: Analyze the project brief to extract the following key information:
    - Core project goals and objectives.
    - The primary problem the project solves.
    - Key features and functional requirements.
    - Target users or audience.
    - Any mentioned technologies, languages, or frameworks.
    - Any specified constraints or non-functional requirements.

### 4. Generate `productContext.md`
- **Action**: Based on the synthesis of the project brief and codebase analysis, populate `productContext.md` with:
    - A clear statement of the problem this project solves.
    - A description of the target user and their needs.
    - The core value proposition and user experience goals.

### 5. Generate `techContext.md`
- **Action**: Populate `techContext.md` by:
    - Listing all technologies, languages, frameworks, and dependencies identified during the codebase analysis.
    - Cross-reference this with any technologies mentioned in the project brief, noting any discrepancies.

### 6. Generate `systemPatterns.md`
- **Action**: Create an initial, high-level draft in `systemPatterns.md`:
    - Document the existing system architecture and design patterns discovered during the codebase analysis.
    - If the project is new, outline a potential architecture based on the project brief and the chosen tech stack.
    - Identify the main components and their relationships.
    - This will serve as a starting point for architectural decisions.

### 7. Generate `activeContext.md`
- **Action**: Initialize `activeContext.md` to set the immediate focus:
    - **Current Work**: "Initializing project based on `projectbrief.md`."
    - **Next Steps**: Define the first logical implementation task derived from the brief (e.g., "Set up the project structure for the authentication feature.").

### 8. Generate `progress.md`
- **Action**: Populate `progress.md` with the project's starting state:
    - **What Works**: Document any existing, functional components identified during the codebase analysis. If the project is new, state: "Project initialized. Memory Bank populated."
    - **What's Left to Build**: List the high-level features from the project brief as pending tasks, taking into account what may already be partially implemented.
    - **Known Issues**: "None."

### 9. Confirmation and Review
- **Action**: After populating all files, report back to the user with a summary of the initialized context, including key findings from the codebase analysis.
- **Action**: Ask for the user's review and approval of the newly populated Memory Bank before proceeding with the first implementation task.
