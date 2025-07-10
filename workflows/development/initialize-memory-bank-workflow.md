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

### 2. Synthesize `projectbrief.md`
- **Action**: Analyze the project brief to extract the following key information:
    - Core project goals and objectives.
    - The primary problem the project solves.
    - Key features and functional requirements.
    - Target users or audience.
    - Any mentioned technologies, languages, or frameworks.
    - Any specified constraints or non-functional requirements.

### 3. Generate `productContext.md`
- **Action**: Based on the synthesis, populate `productContext.md` with:
    - A clear statement of the problem this project solves.
    - A description of the target user and their needs.
    - The core value proposition and user experience goals.

### 4. Generate `techContext.md`
- **Action**: Populate `techContext.md` by:
    - Listing all technologies, languages, frameworks, and dependencies mentioned in the brief.
    - If no stack is specified, note this and propose a suitable default stack based on the project type (e.g., "React/Node.js for a web app").

### 5. Generate `systemPatterns.md`
- **Action**: Create an initial, high-level draft in `systemPatterns.md`:
    - Outline a potential system architecture (e.g., "Monolithic App," "Client-Server," "Microservices").
    - Identify the main components and their relationships based on the feature requirements.
    - This will serve as a starting point for architectural decisions.

### 6. Generate `activeContext.md`
- **Action**: Initialize `activeContext.md` to set the immediate focus:
    - **Current Work**: "Initializing project based on `projectbrief.md`."
    - **Next Steps**: Define the first logical implementation task derived from the brief (e.g., "Set up the project structure for the authentication feature.").

### 7. Generate `progress.md`
- **Action**: Populate `progress.md` with the project's starting state:
    - **What Works**: "Project initialized. Memory Bank populated."
    - **What's Left to Build**: List the high-level features from the project brief as pending tasks.
    - **Known Issues**: "None."

### 8. Confirmation and Review
- **Action**: After populating all files, report back to the user with a summary of the initialized context.
- **Action**: Ask for the user's review and approval of the newly populated Memory Bank before proceeding with the first implementation task.
