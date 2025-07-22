# Workflow: Analyze Codebase and Create Scratchpad

## 1. Purpose
This workflow provides a **strict, evidence-based process** for analyzing a codebase. Its **sole objective** is to produce a detailed `analysis_scratchpad.md` file that documents the ground truth of the code. This serves as the input for the `populate-memory-bank-workflow.md`.

## 2. Workflow Steps

### Step 1: Create the Scratchpad
- **Action**: Create a new file named `memory-bank/analysis_scratchpad.md`. This file will be populated with all findings from the following steps.

### Step 2: Code-First Analysis & Evidence Gathering

**Objective**: To systematically explore the codebase and document raw findings in the scratchpad without interpretation.

#### 2a. File & Directory Mapping
- **Tool**: `list_files`
- **Action**:
    1.  Perform a non-recursive `list_files` on the root directory to identify top-level structure.
    2.  Identify key source directories (e.g., `src`, `app`, `lib`, `pkg`, `cmd`, `server`).
    3.  Perform a recursive `list_files` on each key source directory.
- **Scratchpad Output**: Add a "File & Directory Map" section to the scratchpad with the complete file listings.

#### 2b. Dependency Analysis
- **Tool**: `read_file`
- **Action**:
    1.  Identify and read the contents of all dependency management files to determine the project's technology stack.
- **Examples of Files to Look For**:
    - **Node.js**: `package.json`
    - **Python**: `requirements.txt`, `pyproject.toml`
    - **Go**: `go.mod`
    - **Java**: `pom.xml` (Maven), `build.gradle` (Gradle)
    - **Ruby**: `Gemfile`
    - **PHP**: `composer.json`
    - **Rust**: `Cargo.toml`
- **Scratchpad Output**: Add a "Dependencies" section to the scratchpad and list every dependency found.

#### 2c. Code Definition Extraction
- **Tool**: `list_code_definition_names`
- **Action**:
    1.  Run `list_code_definition_names` on the key source directories identified in step 2a.
- **Scratchpad Output**: Add a "Code Definitions" section to the scratchpad and list all definitions discovered.

#### 2d. Entry Point & Core Logic Identification
- **Tool**: `search_files` and `read_file`
- **Action**:
    1.  Based on the tech stack discovered, use `search_files` to locate application entry points.
    2.  Read the entry point file(s) and follow imports to discover and read 2-3 other critical files.
- **Scratchpad Output**: Add a "Core Logic Notes" section to the scratchpad with summaries of the critical files you read.

### Step 3: Finalization
- **Action**: The workflow is complete once the `memory-bank/analysis_scratchpad.md` file is fully populated and saved.
- **Action**: Report to the user that the analysis is complete and the scratchpad is ready for review.
