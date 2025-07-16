# Prompt: Scaffold New Feature

**Objective:** To create the necessary file and folder structure, boilerplate code, and initial documentation for a new feature, ensuring it aligns perfectly with the project's existing architecture and conventions.

**Context:** We are about to begin development on a new feature. This prompt initiates the process of setting up the foundational scaffolding so that development can begin quickly and consistently.

---

### **1. Feature Scaffolding Plan**

Your first task is to create a plan for the new feature's structure.

-   **Feature Name:** `[Provide a clear, descriptive name for the new feature, e.g., "User Profile Editing."]`
-   **Core Responsibilities:** `[Briefly describe what this feature will do.]`

Based on the feature description and your knowledge of the existing system patterns, you MUST propose a plan that includes:
-   **Directory Structure:** A list of the new directories to be created.
-   **File Structure:** A list of the new files to be created within those directories (e.g., `index.js`, `UserProfile.jsx`, `UserProfile.css`, `userProfile.service.js`, `userProfile.test.js`).
-   **Boilerplate Content:** A brief description of the initial boilerplate code that will go into each file (e.g., "React component skeleton," "empty service class," "basic test setup").

### **2. Execute Scaffolding**

Once the plan is approved, create all the specified directories and files. Populate them with the planned boilerplate code. The boilerplate should:
-   Adhere to all `.clinerules`.
-   Correctly import any necessary dependencies.
-   Include placeholder comments (e.g., `// TODO: Implement user data fetching`) where appropriate.

### **3. Initial Documentation**

After creating the files, you MUST update the Memory Bank:
-   **`memory-bank/activeContext.md`**:
    -   Announce the start of the new feature development.
    -   Briefly describe the feature and link to the main component/service file.
-   **`memory-bank/progress.md`**:
    -   Add the new feature to the "What's Left to Build" section.
    -   Break the feature down into a checklist of smaller, actionable implementation tasks.

### **4. Verification**

Confirm that the scaffolding is complete, all files are in the correct place, and the initial documentation provides a clear roadmap for developing the feature.
