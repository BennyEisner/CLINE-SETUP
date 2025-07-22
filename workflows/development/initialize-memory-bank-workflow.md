# Evidence-Based Memory Bank Initialization Workflow

## 1. Purpose
This workflow provides a **strict, evidence-based, and repeatable process** for initializing the Memory Bank. Its primary goal is to eliminate variability and ensure the Memory Bank is a **verifiable reflection of the codebase's ground truth**. The core principle is **"code first."**

## 2. Prerequisites
- The `memory-bank/` directory exists.
- A `memory-bank/projectbrief.md` file exists, containing the high-level project goals.

## 3. Workflow Steps

### Step 1: Code-First Analysis & Evidence Gathering

**Objective**: To systematically explore the codebase and document raw findings without interpretation. All findings from this step **MUST** be recorded in a temporary file: `memory-bank/analysis_scratchpad.md`.

**Action**: Create the `memory-bank/analysis_scratchpad.md` file. You will populate it in the following sub-steps.

#### 1a. File & Directory Mapping
- **Tool**: `list_files`
- **Action**:
    1.  Perform a non-recursive `list_files` on the root directory to identify top-level structure.
    2.  Identify key source directories (e.g., `src`, `app`, `lib`, `pkg`, `cmd`, `server`).
    3.  Perform a recursive `list_files` on each key source directory.
- **Scratchpad Output**: Add a "File & Directory Map" section to the scratchpad with the complete file listings.

#### 1b. Dependency Analysis
- **Tool**: `read_file`
- **Action**:
    1.  Identify and read the contents of all dependency management files. This is how you determine the project's technology stack.
    2.  Extract the precise list of all dependencies, dev dependencies, and required versions.
- **Examples of Files to Look For**:
    - **Node.js**: `package.json`
    - **Python**: `requirements.txt`, `pyproject.toml`
    - **Go**: `go.mod`
    - **Java**: `pom.xml` (Maven), `build.gradle` (Gradle)
    - **Ruby**: `Gemfile`
    - **PHP**: `composer.json`
    - **Rust**: `Cargo.toml`
    - **Containerization**: `Dockerfile`, `docker-compose.yml`
- **Scratchpad Output**: Add a "Dependencies" section to the scratchpad and list every dependency found.

#### 1c. Code Definition Extraction
- **Tool**: `list_code_definition_names`
- **Action**:
    1.  Run `list_code_definition_names` on the key source directories identified in step 1a.
    2.  Collect all function names, class names, struct names, and other primary definitions.
- **Scratchpad Output**: Add a "Code Definitions" section to the scratchpad and list all definitions discovered.

#### 1d. Entry Point & Core Logic Identification
- **Tool**: `search_files` and `read_file`
- **Action**:
    1.  **Identify Entry Points**: Based on the tech stack discovered in step 1b, use `search_files` to locate application entry points.
    2.  **Identify Core Logic**: Read the entry point file(s) and follow the import/require statements to discover and read 2-3 other critical files.
- **How to Find Critical Files (Language-Specific Guide)**:
    - **For a React Frontend**:
        - **Entry Point**: Search for `ReactDOM.render` or `createRoot`. This will likely be in `index.js` or `main.jsx`.
        - **Core Logic**: Look for the root component (e.g., `<App />`), main router setup (e.g., `react-router-dom`), and state management configuration (e.g., Redux `store.js` or a main `Context.js` file).
    - **For a Node.js Backend (Express)**:
        - **Entry Point**: Search for `app.listen`. This is typically in `server.js`, `index.js`, or `app.js`.
        - **Core Logic**: Look for where routes are defined (e.g., `app.use('/api', router)`), database connection logic (e.g., `mongoose.connect`), and primary middleware.
    - **For a Python Application (Flask/Django)**:
        - **Entry Point**: Search for `app.run()` (Flask) or find `manage.py` and `settings.py` (Django).
        - **Core Logic**: Look for `urls.py` or files with `@app.route` decorators (Flask) to understand routing. Find models in `models.py` and business logic in `views.py` or service modules.
    - **For a Go Application**:
        - **Entry Point**: Search for `func main()`. This is often in `main.go` or a file inside a `cmd/` directory.
        - **Core Logic**: Look for `http.HandleFunc` or a router library (e.g., `gorilla/mux`, `chi`) to understand request handling. Identify key packages in `pkg/` or `internal/` that contain the core business logic.
- **Scratchpad Output**: Add a "Core Logic Notes" section to the scratchpad with summaries of the critical files you read, explaining how they connect.

**CRITICAL RULE**: You are **NOT PERMITTED** to proceed to Step 2 until the `analysis_scratchpad.md` is fully populated with the raw data from these four sub-steps.

### Step 2: Structured Synthesis & Discrepancy Analysis

**Objective**: To compare the evidence from the scratchpad against the goals of the `projectbrief.md`.

#### 2a. Read the Project Brief
- **Tool**: `read_file`
- **Action**: Now, and only now, read the `memory-bank/projectbrief.md`.

#### 2b. Compare and Document Discrepancies
- **Action**: Compare the goals in the brief with the evidence in the scratchpad.
- **Scratchpad Output**: Add a "Discrepancy Report" section to the scratchpad. For any goal mentioned in the brief, note whether corresponding code/dependencies exist.
    - **Example**: "Brief mentions a 'user authentication' feature. Scratchpad shows `bcrypt` and `jsonwebtoken` dependencies and a `UserController.js` file, confirming work has started. No UI components for login were found."
    - **Example**: "Brief mentions 'data visualization'. No charting libraries or related components were found in the scratchpad. This feature has not been started."

### Step 3: Generate Memory Bank Files from Evidence

**Objective**: To populate the final Memory Bank files by **directly transferring and structuring the information** from the `analysis_scratchpad.md`.

**CRITICAL RULE**: The content for each file **MUST** be derived from the scratchpad. Do not invent or infer information.

#### 3a. Generate `techContext.md`
- **Source**: "Dependencies" and "File & Directory Map" sections of the scratchpad.
- **Action**: Create `techContext.md`. The "Technologies" and "Dependencies" sections of this file must be a clean, formatted version of the data from the scratchpad.

#### 3b. Generate `systemPatterns.md`
- **Source**: "Code Definitions" and "Core Logic Notes" sections of the scratchpad.
- **Action**: Create `systemPatterns.md`. Document the architecture based on the actual classes, functions, and file structures listed in the scratchpad.

#### 3c. Generate `productContext.md`
- **Source**: `projectbrief.md` and "Discrepancy Report" from the scratchpad.
- **Action**: Create `productContext.md`. Describe the product goals from the brief, but add notes on the current implementation status based on the discrepancy report.

#### 3d. Generate `progress.md`
- **Source**: "Discrepancy Report" from the scratchpad.
- **Action**: Create `progress.md`.
    - "What Works" must list features confirmed by evidence in the scratchpad.
    - "What's Left to Build" must list features from the brief that have no corresponding evidence in the scratchpad.

#### 3e. Generate `activeContext.md`
- **Source**: All sections of the scratchpad.
- **Action**: Create `activeContext.md`.
    - **Current Work**: "Memory Bank initialized via evidence-based workflow."
    - **Next Steps**: Propose the most logical next step based on the "What's Left to Build" section of `progress.md`.

### Step 4: Finalization

- **Action**: Delete the `memory-bank/analysis_scratchpad.md` file.
- **Action**: Present a summary of the findings and the recommended next steps to the user for confirmation.
