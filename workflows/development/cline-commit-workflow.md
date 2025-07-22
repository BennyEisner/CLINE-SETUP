# Workflow: Intelligent Git Commit

## 1. Purpose
This workflow provides an **intelligent, context-aware process** for committing work to the repository. It is designed to follow standard Git best practices by either creating a new feature branch or committing to an existing one, depending on the current context.

## 2. Guiding Principles
- **Protect Primary Branches**: Never commit directly to `main`, `master`, or `develop`.
- **Work on Feature Branches**: All new work should be done on a descriptively named feature branch.
- **Commit Incrementally**: Add logical, incremental commits to an existing feature branch if the work is related.

## 3. Workflow Steps

### Step 1: Identify Changes
- **Action**: Before starting the commit process, identify the files that have been created or modified.

### Step 2: Analyze the Current Branch
**Goal**: To determine if a new branch is needed.

1.  **Tool**: `execute_command`
    - **Action**: Run the command `git branch --show-current` to get the name of the currently active branch.
2.  **Decision Gate**:
    - **Analyze the output**:
        - **IF** the current branch is `main`, `master`, or `develop`:
            - A new branch **MUST** be created. Proceed to **Step 3**.
        - **ELSE** (the current branch is already a feature branch, e.g., `feature/add-login-page`):
            - A new branch is **NOT** needed. Skip to **Step 4**.

### Step 3: Create a New Feature Branch (If Needed)
**Goal**: To create a new, descriptively named branch off the primary branch.

1.  **Determine Branch Name**:
    - **Action**: Based on the task, create a descriptive branch name following the `type/short-description` convention.
    - **Examples**: `feature/add-user-authentication`, `fix/resolve-login-bug`, `docs/update-readme`.
2.  **Tool**: `execute_command`
    - **Action**: Run the command `git checkout -b <new-branch-name>` to create and switch to the new branch.

### Step 4: Stage and Commit Changes
**Goal**: To save the work with a clear, conventional commit message.

1.  **Determine Commit Message**:
    - **Action**: Write a commit message that follows the [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/) specification.
    - **Format**: `type(scope): short description`
    - **Examples**: `feat(auth): implement password hashing`, `fix(api): correct user lookup error`, `docs(readme): add setup instructions`.
2.  **Tool**: `execute_command`
    - **Action**: Run the command `git add .` to stage all changes.
    - **Action**: Run the command `git commit -m "<your-commit-message>"` to commit the staged changes.

### Step 5: Report the Result
**Goal**: To inform the user of the outcome.

- **Action**: Report back to the user, clearly stating what was done.
- **Example (New Branch Created)**: "I have committed the changes to a new branch named `feature/add-user-authentication`."
- **Example (Committed to Existing Branch)**: "I have added a new commit to the existing `feature/add-login-page` branch."
