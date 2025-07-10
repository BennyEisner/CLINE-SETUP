# Cline Setup Repository

This repository contains a standardized, automated system for setting up and managing project context using the **Cline Memory Bank**. It is designed to be cloned into an existing project to instantly deploy a comprehensive documentation and context management framework.

## Table of Contents

- [Core Concepts](#core-concepts)
- [Quickstart: Setting Up Your Project](#quickstart-setting-up-your-project)
- [Post-Setup Workflow](#post-setup-workflow)
- [Directory Structure](#directory-structure)
- [Verification](#verification)
- [Using the Project Brief Prompt](#using-the-project-brief-prompt)
- [Initializing the Memory Bank](#initializing-the-memory-bank)
- [Managing Cline's Rules (`.clinerules`)](#managing-clines-rules-clinerules)
- [Maintaining and Utilizing the Memory Bank](#maintaining-and-utilizing-the-memory-bank)
- [Troubleshooting](#troubleshooting)
- [Best Practices](#best-practices)
---

## Core Concepts

This setup system is built on a few core components that work together to provide Cline with context and guidance.

-   **Memory Bank**: The project's long-term memory. This is a structured set of Markdown files in the `memory-bank/` directory that stores all critical project information—from high-level goals and product context to technical details and architecture. It serves as the single source of truth for the project's state, history, and objectives.

-   **Cline Rules**: A persistent set of rules and guidelines that Cline must follow. This system focuses on **Workspace Rules**, which are specific to the project you are working on. These rules ensure that Cline's behavior and output align with your project's specific coding standards, architectural patterns, and other requirements.

-   **Clinerules Bank**: A repository for all your Cline Rules, located in the `clinerules-bank/` directory. It acts as a library, holding different rule sets for various technologies or environments (e.g., `react`, `python`, `aws`). This makes it easy to manage and reuse rules across different contexts.

-   **Active Rules (`.clinerules/`)**: The set of rules that are currently *active* for Cline to follow. This directory's content is managed by the activation script, which copies the relevant rules from the `clinerules-bank/` into `.clinerules/`. Cline *only* reads from this directory, ensuring it uses the correct context for the current task.

-   **Activation Scripts**: The `scripts/activate-rules.sh` script is a powerful tool that makes it easy to toggle between different sets of Cline Rules. You can use it to activate, list, or clear rule sets, automatically managing the content of the `.clinerules/` directory.

-   **Workflow System**: The files within the `workflows/` directory define automated, step-by-step processes for completing common, complex tasks like initializing the project or populating the memory bank. This ensures consistency and reliability in how tasks are executed.

---

## Quickstart: Setting Up Your Project

Follow these steps to integrate the Cline Memory Bank and workflow system into your existing project.

### Step 1: Navigate to Your Project Directory

Open your terminal and change into the root directory of the project you want to set up.

```bash
cd /path/to/your/existing-project
```

### Step 2: Clone the Setup Repository

Clone this `Cline-Setup` repository into your project directory.

```bash
git clone https://github.com/BennyEisner/Cline-Setup.git
```

### Step 3: Run the Setup Script

Execute the setup script, which will create the entire directory structure and copy all the necessary templates and files into your project.

```bash
./Cline-Setup/scripts/setup-project.sh
```

### Step 4: Clean Up (Optional)

After the script completes the `Cline-Setup` directory is no longer needed so you can remove it.

```bash
rm -rf Cline-Setup
```

### One-Liner Command

```bash
git clone https://github.com/BennyEisner/Cline-Setup.git && ./Cline-Setup/scripts/setup-project.sh && rm -rf Cline-Setup
```

---

## Post-Setup Workflow

Once the setup is complete, your project is ready for Cline. The typical workflow is as follows:

### 1. Create the Project Brief

If you are integrating this system into a project with existing code, the first step is to generate a comprehensive **Project Brief**. This brief will serve as the foundation for the entire Memory Bank.

**How to do it:**
1.  Copy the contents of the `project-brief-prompt.md` file.
2.  Paste the prompt into your chat with Cline.
3.  Cline will analyze your repository, generate a detailed project brief, and automatically save it to `memory-bank/projectbrief.md`.

### 2. Initialize the Memory Bank

With the `projectbrief.md` in place, you can now instruct Cline to populate the rest of the Memory Bank.

**How to do it:**
1.  Simply ask Cline: **"Initialize the memory bank according to your workflow."**
2.  Cline will follow the `initialize-memory-bank-workflow.md` to:
    - Read the `projectbrief.md`.
    - Synthesize the information to understand the project's goals, tech stack, and architecture.
    - Populate all other core Memory Bank files (`productContext.md`, `techContext.md`, `systemPatterns.md`, `activeContext.md`, and `progress.md`).
    - Report back with a summary and wait for your approval before starting any development tasks.

---

## Directory Structure

The setup script creates the following directories and files in your project root:

### Core Directories

-   **`.clinerules/`**: Contains the active rules and guidelines Cline must follow for this specific project.
    -   `01-coding-standards-example.md`: An example of basic coding standards and conventions. This can be changed or deleted as it is purley a template.
    -   `initializememorybank.md`: Instructions for Cline's memory bank workflow
    
-   **`clinerules-bank/`**: A library of rule templates and environment-specific configurations.
    -   `01-coding-standards-example.md`: Template for coding standards
    -   `environments/`: Directory for language/framework-specific rules
    
-   **`memory-bank/`**: The core of the system. All project context, progress, and documentation live here.
    -   `projectbrief.md`: The foundational document describing the project
    -   `productContext.md`: The "why" behind the project - problems solved and user needs
    -   `techContext.md`: The technologies, tools, and technical constraints
    -   `systemPatterns.md`: The architecture, design patterns, and component relationships
    -   `activeContext.md`: The current focus, recent changes, and next steps
    -   `progress.md`: The overall project status, completed work, and known issues
    
-   **`scripts/`**: Contains automation scripts for project management.
    -   `activate-rules.sh`: Script to activate project-specific rules
    -   `setup-project.sh`: Script to handle the initial setup.
    
-   **`workflows/`**: Contains detailed step-by-step guides for development processes. 
    -   `development/setup-project.md`: Guide for setting up the Cline infrastructure
    -   `development/initialize-memory-bank-workflow.md`: Workflow for populating the memory bank

---

## Verification

After running the setup script, verify that everything was installed correctly:

### Check Directory Structure
```bash
# Verify all directories were created
ls -la .clinerules/
ls -la clinerules-bank/
ls -la memory-bank/
ls -la scripts/
ls -la workflows/
```

### Check File Contents
```bash
# Verify key files exist and have content
cat .clinerules/initializememorybank.md | head -10
cat memory-bank/projectbrief.md
cat workflows/development/initialize-memory-bank-workflow.md | head -10
```

### Test Script Permissions
```bash
# Verify scripts are executable
ls -la scripts/activate-rules.sh
```

---

## Using the Project Brief Prompt

The `project-brief-prompt.md` file contains a comprehensive prompt designed to help Cline analyze your existing codebase and generate a detailed project brief.

### Step-by-Step Process

1. **Open the prompt file**:

2. **Copy the entire contents** of the file.

3. **Replace the placeholder**: In the prompt, replace `{{REPOSITORY_PATH}}` with the actual path to your projects root directory.

4. **Paste into Cline**: Start a new conversation with Cline and paste the modified prompt.

5. **Wait for analysis**: Cline will:
   - Analyze all files in your repository
   - Examine documentation, source code, configuration files
   - Generate a comprehensive breakdown
   - Create a detailed project brief
   - Automatically save it to `memory-bank/projectbrief.md`

### What the Analysis Includes

The project brief prompt instructs Cline to examine:
- README files and documentation
- Source code structure and patterns
- Configuration files (package.json, requirements.txt, etc.)
- Build and deployment scripts
- Test suites and testing patterns
- Git history and development patterns

---

## Initializing the Memory Bank

Once you have a populated `projectbrief.md`, you can have Cline initialize the complete memory bank system.

### The Initialization Process

1. **Trigger the workflow**: Simply tell Cline: **"Initialize the memory bank"**

2. **Cline will follow the workflow**:
   - Read and analyze `memory-bank/projectbrief.md`
   - Extract key information about goals, features, and technical requirements
   - Populate `productContext.md` with user needs and value proposition
   - Fill `techContext.md` with technology stack and dependencies
   - Create initial `systemPatterns.md` with architectural decisions
   - Set up `activeContext.md` with current focus and next steps
   - Initialize `progress.md` with project status and pending tasks

3. **Review and approval**: Cline will present a summary of the populated memory bank and ask for your approval before proceeding with any development work.

### Memory Bank File Relationships

The memory bank files work together in a hierarchical structure:

```
projectbrief.md (Foundation)
    ├── productContext.md (Why this project exists)
    ├── techContext.md (How it's built)
    └── systemPatterns.md (Architecture decisions)
            ↓
    activeContext.md (Current focus)
            ↓
    progress.md (Status and next steps)
```

---

## Managing Cline's Rules (`.clinerules`)

The `.clinerules` directory contains the set of active rules that Cline must follow for your project. This system is designed to be flexible, allowing you to activate different sets of rules based on your project's technology stack and requirements.

### Core Concepts

-   **`clinerules-bank/`**: This is your library of all available rule templates. It's where you store general rules and environment-specific rule sets.
    -   **General Rules**: Files in the root of `clinerules-bank/` are considered "general" and are always activated.
    -   **Environments**: Files within `clinerules-bank/environments/` are specific to a technology or framework (e.g., `react.md`, `python.md`).
-   **`.clinerules/`**: This directory holds the currently *active* rules. Cline only reads from this directory. The `activate-rules.sh` script manages what goes in here.

### Using the `activate-rules.sh` Script

The `scripts/activate-rules.sh` script is your primary tool for managing which rules are active.

**1. List Available Rules**

To see all the general and environment-specific rules available in your `clinerules-bank/`:

```bash
./scripts/activate-rules.sh list
```

**2. Activate Environment Rules**

To activate rules for one or more environments, simply pass their names to the script. This will clear any existing rules in `.clinerules/`, copy the general rules, and then copy the specified environment rules.

```bash
# Activate rules for a React project
./scripts/activate-rules.sh react

# Activate rules for a project using both Node.js and Docker
./scripts/activate-rules.sh nodejs docker
```

**3. Check Active Rules**

To see which rules are currently active in the `.clinerules/` directory:

```bash
./scripts/activate-rules.sh status
```

**4. Clear All Active Rules**

To remove all rules from the `.clinerules/` directory:

```bash
./scripts/activate-rules.sh clear
```

### Creating and Customizing Rules

You can easily create new rules or customize existing ones.

**1. Create a New Environment Rule Set**

Let's say you want to add rules for `tailwind-css`.

-   Create a new file in the environments directory:
    ```bash
    touch clinerules-bank/environments/tailwind-css.md
    ```
-   Add your custom rules to this new Markdown file.
-   The `activate-rules.sh` script will automatically discover it. You can now activate it:
    ```bash
    ./scripts/activate-rules.sh tailwind-css
    ```

**2. Customize Existing Rules**

It's best practice to edit the templates in `clinerules-bank/` rather than the active rules in `.clinerules/`, as the active ones will be overwritten.

-   Open the rule file you want to change, for example:
    ```bash
    nano clinerules-bank/01-coding-standards-example.md
    ```
-   Make your edits and save the file.
-   Re-run the activation script to apply your changes to the active rules.

---

## Maintaining and Utilizing the Memory Bank

Once initialized, the Memory Bank becomes a living document. Proper maintenance is key to ensuring Cline remains a highly effective and contextualized development partner. This section covers the ongoing workflow for using and updating the Memory Bank.

### The Development Cycle with Cline

Think of your work with Cline as a continuous loop. The goal is to keep the Memory Bank synchronized with your project's reality.

1.  **Start of Session: Context Refresh**
    -   **Action**: Begin every new work session by instructing Cline to get up to speed. Since its memory is not persistent, this step is critical.
    -   **Prompt**: `"Review the entire memory bank and summarize the current project status, active context, and next steps."`

2.  **During Session: Leverage Custom Instructions**
    -   **Action**: Before starting a task, ensure the correct workspace rules are active. The `.clinerules` act as powerful, on-the-fly custom instructions that guide Cline's behavior.
    -   **Example**: If you're working on the frontend, activate the `react` rules: `./scripts/activate-rules.sh react`. This tells Cline to adhere to React-specific coding standards and patterns.
    -   **Why it matters**: This ensures Cline's output (code, suggestions, etc.) is consistent with your project's specific requirements, saving you time on refactoring.

3.  **End of Session: Capture Progress**
    -   **Action**: After making significant progress or at the end of a work session, have Cline update the Memory Bank. This captures the latest changes, decisions, and learnings.
    -   **Prompt (Broad)**: `"Update the memory bank to reflect our work today. We completed the user login form and fixed the session bug."`
    -   **Prompt (Specific)**: For more control, you can direct updates to specific files:
        -   `"Update progress.md to show the login form is complete and the session bug is resolved."`
        -   `"Update activeContext.md to set the next task as building the user profile page."`
        -   `"A new API utility was created. Please document its pattern in systemPatterns.md."`

### Why This Workflow is Important

-   **Prevents Context Drift**: Regular updates ensure Cline's understanding doesn't diverge from the project's reality.
-   **Maximizes Efficiency**: Starting with a context refresh means you don't waste time re-explaining past work.
-   **Enforces Consistency**: Using `.clinerules` ensures that all contributions, whether from you or Cline, adhere to the same standards.
-   **Creates a Living Record**: The Memory Bank evolves into a comprehensive, always-current knowledge base for the project, invaluable for onboarding new team members or for your own future reference.

### Managing Multiple Projects

Each project must have its own independent copy of this infrastructure. The Memory Bank and Cline Rules are project-specific and should never be shared between different codebases to avoid context contamination.

---

## Troubleshooting

### Setup Script Fails

If the setup script encounters errors:

1. **Check permissions**:
   ```bash
   chmod +x Cline-Setup/scripts/setup-project.sh
   ```

2. **Run with verbose output**:
   ```bash
   bash -x ./Cline-Setup/scripts/setup-project.sh
   ```

3. **Manual setup**: If the script fails, you can manually create the directories and copy files:
   ```bash
   mkdir -p .clinerules clinerules-bank/environments memory-bank scripts workflows/development
   cp -r Cline-Setup/.clinerules/* .clinerules/
   cp -r Cline-Setup/memory-bank/* memory-bank/
   # Continue copying other directories...
   ```

### Memory Bank Not Initializing

If Cline doesn't properly initialize the memory bank:

1. **Check projectbrief.md**: Ensure it contains detailed project information
2. **Verify file permissions**: Make sure all memory bank files are readable/writable
3. **Clear instruction**: Use the exact phrase "Initialize the memory bank"
4. **Manual review**: Ask Cline to "Read all memory bank files and summarize their current state"

### Missing Files After Setup

If some files are missing after setup:

1. **Re-run the setup script**:
   ```bash
   ./Cline-Setup/scripts/setup-project.sh
   ```

2. **Check the source repository**: Ensure all files exist in the original Cline-Setup repository

3. **Manual file copy**: Copy missing files individually from the Cline-Setup directory

---

## Best Practices

### For Project Briefs
- Be specific about technical requirements and constraints
- Include information about target users and use cases
- Mention any existing code patterns or architectural decisions
- Specify deployment requirements and environments

### For Memory Bank Management
- Update the memory bank regularly as the project evolves
- Keep `activeContext.md` current with your immediate focus
- Use `progress.md` to track completed milestones and known issues
- Review and update `systemPatterns.md` when making architectural changes

### For Working with Cline
- Always start new sessions by asking Cline to read the memory bank
- Use specific, actionable language when requesting updates
- Provide feedback on Cline's work to improve future interactions
- Keep the memory bank files concise but comprehensive
