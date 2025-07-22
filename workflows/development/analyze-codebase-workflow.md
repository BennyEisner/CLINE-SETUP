# Workflow: Top-Down Codebase Analysis

## 1. Purpose
This workflow establishes a **top-down, multi-zone analysis process** to ensure a comprehensive understanding of any codebase. It is designed to prevent a narrow perspective by first mapping the project's high-level architecture and then conducting deep-dive investigations into each major functional area.

## 2. Guiding Principles
- **Breadth First, Then Depth**: First, understand the overall layout. Then, analyze the details of each component.
- **Assume Standard Layouts**: Look for common architectural patterns and directory structures first.
- **Document Everything**: The `analysis_scratchpad.md` is the single source of truth for the analysis. Every finding and summary must be recorded there.

## 3. Workflow Steps

### Step 1: Setup
- **Action**: Create a new file named `memory-bank/analysis_scratchpad.md`.

### Step 2: Phase 1 - High-Level Architectural Mapping
**Goal**: To identify the key functional zones of the project based on its directory structure.

1.  **Tool**: `list_files -r`
    - **Action**: Get a complete, recursive listing of all files and directories in the project.
2.  **Analysis**:
    - **Action**: Review the directory list and identify the primary architectural zones. Look for common, high-level directories that indicate a separation of concerns.
    - **Common Zone Examples**:
        - **Go/Service Layout**: `cmd/`, `internal/`, `pkg/`, `api/`, `vendor/`
        - **Web App Layout**: `src/components/`, `src/pages/`, `src/services/`, `src/store/`, `src/hooks/`, `public/`, `config/`
        - **Monorepo Layout**: `packages/`, `apps/`, `libs/`
        - **API Server Layout**: `controllers/`, `routes/`, `models/`, `middleware/`, `config/`
3.  **Scratchpad Output**:
    - Create a section named `## Phase 1: Architectural Map`.
    - Create a subsection named `### Identified Key Zones`.
    - List the paths of the key directories you have identified as the project's major functional zones.
    - **Example**:
      ```markdown
      ## Phase 1: Architectural Map
      ### Identified Key Zones
      - `cmd/`
      - `internal/auth`
      - `internal/user`
      - `pkg/database`
      - `api/`
      ```

---

### Step 3: Phase 2 - Targeted Deep Dive Analysis
**Goal**: To conduct a thorough investigation of each key zone identified in Phase 1.

1.  **Iterate Through Zones**:
    - **Action**: For **each key zone** listed in the scratchpad from Phase 1, perform the following deep-dive analysis.
2.  **Deep Dive Process (Per Zone)**:
    a. **Identify Core Files**:
        - **Action**: List the files within the current zone's directory.
        - **Action**: Select the 2-3 most important-looking files that seem to define the zone's core purpose (e.g., `service.go`, `controller.js`, `index.js`, `main.go`).
    b. **Analyze Core Files**:
        - **Tool**: `read_file`
        - **Action**: Read the contents of the selected core files.
    c. **Summarize the Zone**:
        - **Action**: Based on the files you've read, write a detailed summary for the current zone.
        - **The summary MUST include**:
            - **Purpose**: What is the primary responsibility of this zone? (e.g., "Handles user authentication and token management.")
            - **Key Components**: What are the main classes, functions, or structs in this zone? (e.g., "`AuthService` class with `login` and `register` methods.")
            - **Dependencies**: What other key zones or major libraries does it interact with? (e.g., "Imports the `user` repository from `internal/user` and uses the `jsonwebtoken` library.")
3.  **Scratchpad Output**:
    - Create a section named `## Phase 2: Deep Dive Analysis`.
    - For each zone you analyze, create a subsection with its name (e.g., `### Zone: internal/auth`).
    - Under the subsection, add the full summary you wrote.
    - **Example**:
      ```markdown
      ### Zone: internal/auth
      - **Purpose**: This zone is responsible for handling user authentication and token management.
      - **Key Components**: It contains an `AuthService` with `Login` and `Register` methods, and a `TokenUtil` for generating JWTs.
      - **Dependencies**: It depends on the `UserRepository` from the `internal/user` zone to fetch user data and uses the `bcrypt` library for password hashing.
      ```

---

### Step 4: Phase 3 - Final Synthesis
**Goal**: To create a holistic system overview based on the deep-dive findings.

1.  **Analysis**:
    - **Action**: Review all the zone summaries in the `## Phase 2: Deep Dive Analysis` section of the scratchpad.
2.  **Scratchpad Output**:
    - Create a final section named `## Phase 3: System Synthesis`.
    - Write a high-level paragraph that describes how the different zones work together to form the complete application.
    - **Example**:
      ```markdown
      ## Phase 3: System Synthesis
      The application is a web service whose entry point is in `cmd/`. It exposes an API defined in `api/`. Requests are routed to controllers that use services from the `internal/` directory. The `internal/auth` service handles authentication, and the `internal/user` service manages user data, with both relying on the `pkg/database` zone for database connectivity.
      ```

### Step 5: Finalization
- **Action**: Report to the user: "Top-down analysis is complete. The `analysis_scratchpad.md` contains the architectural map, a deep dive into each key zone, and a final system synthesis. It is ready for review before proceeding to the `populate-memory-bank-workflow`."
