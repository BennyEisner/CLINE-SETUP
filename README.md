# Cline Setup Repository

This repository provides a standardized, automated system for setting up and managing project context using the **Cline Memory Bank**. It is designed to be cloned into an existing project to instantly deploy a comprehensive documentation, workflow, and context management framework.

## Table of Contents

- [Core Concepts](#core-concepts)
- [Quickstart: Setting Up Your Project](#quickstart-setting-up-your-project)
- [The Development Workflow](#the-development-workflow)
- [Directory Structure](#directory-structure)
- [System Components](#system-components)
  - [1. The Memory Bank](#1-the-memory-bank)
  - [2. Cline Rules (`.clinerules`)](#2-cline-rules-clinerules)
  - [3. Workflows](#3-workflows)
  - [4. Prompt Templates](#4-prompt-templates)
- [Authorizing Cline for Git Operations](#authorizing-cline-for-git-operations)
- [Troubleshooting](#troubleshooting)
- [Best Practices](#best-practices)

---

## Core Concepts

This system is built on a few core components that work together to provide Cline with persistent context, rules, and guided workflows.

- **Memory Bank**: The project's long-term memory. A structured set of Markdown files in `memory-bank/` that stores all critical project information—from high-level goals to technical details. It's the single source of truth.
- **Cline Rules**: A persistent set of rules and guidelines in `.clinerules/` that Cline must follow for this specific project, ensuring its output aligns with your standards.
- **Workflows**: Rigid, script-like instructions for highly repeatable tasks that must be executed the same way every time (e.g., initializing the memory bank, committing code). They prioritize consistency and automation.
- **Prompt Templates**: Flexible guides for complex scenarios that require analysis and decision-making (e.g., debugging, refactoring). They provide a structured framework but allow for adaptability.

---

## Quickstart: Setting Up Your Project

Follow these steps to integrate this system into your existing project.

### Step 1: Navigate to Your Project Directory
Open your terminal and change into the root directory of the project you want to set up.
```bash
cd /path/to/your/existing-project
```

### Step 2: Clone and Run the Setup Script
This one-liner command clones the setup repository, runs the installation script, and then cleans up the cloned directory.
```bash
git clone https://github.com/BennyEisner/Cline-Setup.git && ./Cline-Setup/scripts/setup-project.sh && rm -rf Cline-Setup
```
Your project is now equipped with the entire Cline context management system.

---

## The Development Workflow

Once set up, your interaction with Cline follows a simple, powerful loop.

1.  **Generate the Project Brief**: If you have an existing codebase, the first step is to create a foundational document for the Memory Bank.
    -   **How**: Copy the content from `project-brief-prompt.md`, paste it into the chat with Cline, and it will analyze your repository and create `memory-bank/projectbrief.md`.

2.  **Initialize the Memory Bank**: With the brief created, tell Cline to build its full context.
    -   **How**: Simply ask Cline: **"Initialize the memory bank according to your workflow."** Cline will read the brief and populate all other Memory Bank files.

3.  **Use Prompt Templates for Guided Tasks**: To perform a specific, structured task, use a template from the `prompt-templates/` directory.
    -   **How**: Copy the content of a template (e.g., `prompt-templates/refactor-component.md`), fill in the bracketed placeholders (`[Specify Component Name]`), and paste it into the chat. Cline will execute the task according to the structured instructions.

4.  **Maintain the Memory Bank**: At the end of a session, ensure the Memory Bank reflects the latest changes.
    -   **How**: Tell Cline: **"Update the memory bank to reflect our work today."** This keeps Cline's knowledge current for the next session.

---

## Directory Structure

The setup script creates the following directories in your project root:

- **`.clinerules/`**: Contains the active rules and guidelines Cline must follow.
- **`clinerules-bank/`**: A library of rule templates and environment-specific configurations.
- **`memory-bank/`**: The core of the system. All project context, progress, and documentation live here.
- **`prompt-templates/`**: A collection of reusable prompts for guiding Cline through specific tasks.
- **`scripts/`**: Contains automation scripts for project management.
- **`workflows/`**: Contains detailed step-by-step guides for development processes.

---

## System Components

### 1. The Memory Bank
The `memory-bank/` is the heart of the system. It ensures that Cline's understanding of the project is persistent and accurate.

-   `projectbrief.md`: The foundational document describing the project.
-   `productContext.md`: The "why" behind the project—problems solved and user needs.
-   `techContext.md`: The technologies, tools, and technical constraints.
-   `systemPatterns.md`: The architecture, design patterns, and component relationships.
-   `activeContext.md`: The current focus, recent changes, and next steps.
-   `progress.md`: The overall project status, completed work, and known issues.

### 2. Cline Rules (`.clinerules`)
This system allows you to define and activate specific sets of rules for Cline to follow. The `scripts/activate-rules.sh` script manages which rules from the `clinerules-bank/` are copied into the active `.clinerules/` directory.

-   **To list available rules**: `./scripts/activate-rules.sh list`
-   **To activate rules**: `./scripts/activate-rules.sh react`
-   **To clear rules**: `./scripts/activate-rules.sh clear`

### 3. Workflows
The `workflows/` directory contains detailed, automated processes that guide Cline through complex tasks with precision.

-   `initialize-memory-bank-workflow.md`: A step-by-step guide for populating the entire Memory Bank from the project brief.
-   `cline-commit-workflow.md`: An automated workflow for Cline to commit its own changes to a new branch.

### 4. Prompt Templates
The `prompt-templates/` directory contains a powerful set of reusable prompts to direct Cline's work on common, high-value engineering tasks. To use one, copy its content, fill in the placeholders, and paste it into your chat.

#### Memory Bank & Documentation
-   **`deep-dive-component-analysis.md`**: Instructs Cline to perform an in-depth analysis of a specific component and update the Memory Bank with its findings.
-   **`sync-memory-bank.md`**: Triggers a full review of the codebase to ensure all Memory Bank files are accurate and up-to-date.
-   **`document-new-pattern.md`**: Guides Cline to identify and document a new architectural or design pattern in `systemPatterns.md`.

#### Code Analysis & Refactoring
-   **`refactor-component.md`**: A template to initiate the refactoring of a specific component to improve its design, performance, or readability.
-   **`identify-tech-debt.md`**: A prompt to scan the codebase to identify, categorize, and document technical debt in `progress.md`.
-   **`optimize-performance.md`**: Guides Cline to analyze a feature for performance bottlenecks and implement optimizations.

#### New Feature Development
-   **`scaffold-new-feature.md`**: A template to plan and create the necessary files, folders, and boilerplate code for a new feature.
-   **`implement-feature-component.md`**: A granular prompt to implement a specific piece of a larger feature with detailed requirements.

#### Rules & Workflows
-   **`create-new-clinerule.md`**: Instructs Cline to create a new `.clinerule` file to enforce a specific coding standard.
-   **`create-new-workflow.md`**: A template to document a complex, multi-step process as a new workflow file.

#### Testing & Quality Assurance
-   **`add-test-coverage.md`**: Guides Cline to analyze a component, identify untested code, and write the necessary tests.
-   **`setup-testing-framework.md`**: A prompt to set up and configure a testing framework if one doesn't exist.

#### Debugging
-   **`debug-issue.md`**: Provides a structured format for reporting a bug, which guides Cline through reproducing, fixing, and verifying the issue.

---

## Authorizing Cline for Git Operations

This setup includes a workflow that allows Cline to autonomously manage its own work by creating branches and committing changes. This is governed by the `02-cline-git-operations-rule.md` rule and the `cline-commit-workflow.md`. When Cline completes a task, it will use its judgment to decide when to save its work, reporting back with the new branch name.

---

## Troubleshooting

If the setup script fails, check its permissions (`chmod +x Cline-Setup/scripts/setup-project.sh`) and run it again. If issues persist, you can manually create the directories and copy the files from the cloned repository.

---

## Best Practices

-   **Start sessions with a refresh**: Always ask Cline to review the Memory Bank at the start of a new session.
-   **Update regularly**: At the end of a session, instruct Cline to update the Memory Bank to reflect the day's work.
-   **Be specific**: The more specific your instructions and prompts, the better the results.
-   **Use the templates**: Leverage the prompt templates to ensure complex tasks are performed consistently and thoroughly.

### Combining Prompts and Workflows (Hybrid Model)

The most effective way to use this system is to combine Prompt Templates and Workflows. A prompt can guide the overall analytical process while referencing a workflow for a specific, automated step.

**Example**: A `release-new-version.md` prompt could guide the complex analysis required for a release, but for the final step of committing the version bump, it would instruct Cline to follow the rigid `cline-commit-workflow.md`. This gives you the flexibility of guided analysis and the reliability of automation.
