# Workflow: Populate Memory Bank from Scratchpad

## 1. Purpose
This workflow's **sole objective** is to populate the six core Memory Bank files using the evidence gathered in the `memory-bank/analysis_scratchpad.md` file. It is designed to be executed **only after** the `analyze-codebase-workflow.md` is complete.

## 2. Prerequisites
- A `memory-bank/projectbrief.md` file exists.
- A `memory-bank/analysis_scratchpad.md` file exists and is fully populated with the codebase analysis.

## 3. Workflow Steps

### Step 1: Review Evidence and Brief
- **Action**: Read the `memory-bank/analysis_scratchpad.md` file to load the evidence into context.
- **Action**: Read the `memory-bank/projectbrief.md` file to understand the project's high-level goals.

### Step 2: Structured Synthesis & Discrepancy Analysis
- **Action**: Compare the goals in the brief with the evidence in the scratchpad.
- **Action**: Add a "Discrepancy Report" section to the scratchpad. For any goal mentioned in the brief, note whether corresponding code/dependencies exist.
    - **Example**: "Brief mentions a 'user authentication' feature. Scratchpad shows `bcrypt` and `jsonwebtoken` dependencies and a `UserController.js` file, confirming work has started. No UI components for login were found."
    - **Example**: "Brief mentions 'data visualization'. No charting libraries or related components were found in the scratchpad. This feature has not been started."

### Step 3: Generate Memory Bank Files from Evidence
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
    - **Current Work**: "Memory Bank populated from analysis scratchpad."
    - **Next Steps**: Propose the most logical next step based on the "What's Left to Build" section of `progress.md`.

### Step 4: Final Verification & Cleanup
- **Action**: **Verify File Creation.** Use the `ls -l memory-bank/` command to list all files in the memory bank.
- **Action**: **Confirm All 6 Core Files Exist.** Verbally confirm that `projectbrief.md`, `productContext.md`, `techContext.md`, `systemPatterns.md`, `progress.md`, and `activeContext.md` are all present in the output.
- **Action**: **Cleanup.** Only after confirming the existence of all six files, delete the `memory-bank/analysis_scratchpad.md` file.
- **Action**: Report to the user that the Memory Bank has been populated.
