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
- **Action**: **Step 2a: Structured Directory Exploration.** Instead of a single recursive file listing, perform a structured exploration:
    - **1. Top-Level Scan**: Use `list_files` on the root directory (`.`) without recursion to identify top-level files and directories.
    - **2. Identify Key Directories**: From the top-level scan, identify a list of high-value directories to investigate further. Prioritize common names like `src`, `app`, `lib`, `components`, `pages`, `server`, `config`, `scripts`, `tests`, `docs`, `cmd`, `pkg`, `internal`.
    - **3. Deep Dive into Key Directories**: For each identified high-value directory, use `list_files` recursively to get a detailed listing of its contents. This builds a focused understanding of the project's most important areas.
    - **4. Create Project Map**: Synthesize the findings from the directory deep dives into a mental map of the project's structure.
- **Action**: **Step 2b: Dependency & Configuration Analysis.** Identify and read all key configuration and dependency files to determine the technology stack, dependencies, and build process. Prioritize files like:
    - `package.json` (for Node.js projects)
    - `requirements.txt`, `pyproject.toml` (for Python projects)
    - `pom.xml`, `build.gradle` (for Java projects)
    - `go.mod` 
    - `docker-compose.yml`, `Dockerfile` (for containerized services)
    - `.env` files (for environment variables)
    - Any `README.md` files at the root or in subdirectories.
- **Action**: **Step 2c: Search-Based Code Structure Analysis.** Instead of relying on a high-level parsing tool, use `search_files` with regular expressions to find key definitions directly.
    - **1. Determine Language**: Based on the files found in Step 2b (e.g., `package.json` implies JS/TS, `requirements.txt` implies Python, `go.mod` implies Go), select the appropriate regex patterns.
    - **2. Execute Searches**: Run `search_files` on the source directories for each relevant pattern.
    - **Example Regex Patterns**:
        - **For JavaScript/TypeScript**:
            - Function Declarations: `function\s+[A-Za-z0-9_]+`
            - Arrow Function Components/Variables: `const\s+[A-Z][A-Za-z0-9_]+\s*=\s*\(`
            - Class Definitions: `class\s+[A-Z][A-Za-z0-9_]+`
        - **For Python**:
            - Function Definitions: `def\s+\w+\(.*\):`
            - Class Definitions: `class\s+\w+\(.*\):`
        - **For Go**:
            - Function Definitions: `func\s+[A-Za-z0-9_]+`
            - Struct Definitions: `type\s+[A-Z][A-Za-z0-9_]+\s+struct`
    - **3. Synthesize Results**: Collect the names of all discovered functions, classes, and components. This creates a reliable, text-based map of the codebase.
- **Action**: **Step 2d: Deep Code Analysis via File Reading.** After identifying key files, you MUST read their contents to understand the core logic. This is not optional.
    - **1. Read Core Logic Files**: Systematically use `read_file` to analyze the contents of the most critical files. The goal is to understand not just *what* files exist, but *how* they work and what their *current* state is.
    - **2. Prioritize Key Files for Reading**:
        - **Application Entry Point(s)**: (e.g., `index.js`, `main.py`, `App.jsx`, `server.js`, `main.go`).
        - **Core Configuration**: (e.g., `webpack.config.js`, `vite.config.js`, `next.config.js`, `settings.py`).
        - **Main Router/Navigation**: (e.g., `routes.js`, `urls.py`, files containing Go `http.HandleFunc`).
        - **Central State Management**: (e.g., Redux stores, Context providers).
        - **Key Business Logic Modules**: (e.g., `api.js`, `database.js`, files in `services/`, `utils/`, Go packages in `pkg/` or `internal/`).
    - **3. Use Search to Find Entry Points if Needed**: If the entry point is not obvious from file names, use `search_files` for application startup patterns:
        - `ReactDOM.render` or `createRoot` (React)
        - `if __name__ == "__main__"` (Python)
        - `app.listen` (Node.js Express)
        - `public static void main\(String\[\] args\)` (Java)
        - `func\s+main\(\)` (Go)
- **Critical Rule**: This multi-step analysis, including reading the contents of key files, MUST be completed before proceeding. A superficial file listing is not sufficient.

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
