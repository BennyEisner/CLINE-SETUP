# Workflow: End-to-End Git Workflow

## 1. Purpose
This workflow provides an **intelligent, end-to-end process** for getting changes from a local machine into the main branch of the remote repository. It covers local commits, pushing branches, and initiating the pull request process.

## 2. Guiding Principles
- **Protect Primary Branches**: Never commit directly to `main`, `master`, or `develop`.
- **Feature Branch Model**: All work is done on a feature branch, which is then merged via a pull request.
- **Clear Handoff**: The workflow ends with a clear instruction for the user to complete the final step (pull request creation).

## 3. Workflow Steps

### Step 1: Identify Changes
- **Action**: Identify the files that have been created or modified.

### Step 2: Analyze the Current Branch
- **Action**: Run `git branch --show-current` to get the name of the currently active branch.
- **Decision**:
    - **IF** the branch is `main`, `master`, or `develop`, proceed to **Step 3**.
    - **ELSE**, skip to **Step 4**.

### Step 3: Create a New Feature Branch (If Needed)
- **Action**: Determine a descriptive branch name (e.g., `feature/add-user-authentication`).
- **Action**: Run `git checkout -b <new-branch-name>`.

### Step 4: Stage and Commit Changes
- **Action**: Determine a conventional commit message (e.g., `feat(auth): implement password hashing`).
- **Action**: Run `git add .`.
- **Action**: Run `git commit -m "<your-commit-message>"`.

---

### **Step 5: Push Branch to Remote**
**Goal**: To upload the new branch and its commits to the central repository.

1.  **Tool**: `execute_command`
2.  **Action**: Run the command `git push -u origin <branch-name>`, replacing `<branch-name>` with the name of the current feature branch.
    - The `-u` flag sets the upstream tracking branch.

---

### **Step 6: Initiate Pull Request**
**Goal**: To hand off the completed work to the user for review and merging.

1.  **Analyze Push Output**:
    - **Action**: Carefully examine the output from the `git push` command. Look for a URL that can be used to create a pull request.
    - **Example Output from GitHub**:
      ```
      ...
      remote: Create a pull request for 'feature/add-user-authentication' on GitHub by visiting:
      remote:      https://github.com/BennyEisner/Cline-Setup/pull/new/feature/add-user-authentication
      ...
      ```
2.  **Report and Instruct**:
    - **Action**: Report to the user that the branch has been successfully pushed.
    - **Action**: Provide the user with the direct link to create the pull request. If no link is available in the output, instruct them to go to the repository's "Pull Requests" page to create it manually.

### **Step 7: Final Handoff**
- **Example Report**: "I have pushed the changes to the `feature/add-user-authentication` branch. To merge these changes into main, please create a pull request here: `https://github.com/BennyEisner/Cline-Setup/pull/new/feature/add-user-authentication`"
