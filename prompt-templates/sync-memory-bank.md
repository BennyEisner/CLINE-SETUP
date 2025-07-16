# Prompt: Synchronize Memory Bank

**Objective:** To perform a comprehensive review of the entire Memory Bank against the current state of the codebase and bring all documentation into alignment with the ground truth of the project.

**Context:** The Memory Bank can become out-of-sync as the codebase evolves. This prompt initiates a full synchronization to ensure our documentation remains accurate and reliable. This is a critical maintenance task.

---

### **1. Full Codebase Review**

Your primary task is to conduct a fresh, top-to-bottom analysis of the project. You are to act as if you are seeing the codebase for the first time since the last sync.

Your review MUST cover:
- **Project Structure:** Analyze the current file and directory organization. Have any key files or directories been added, removed, or renamed?
- **Core Components & Services:** Re-examine the most critical parts of the application. Has their core logic, API, or responsibility changed?
- **Key Dependencies:** Review the project's dependencies (`package.json`, `requirements.txt`, etc.). Have any significant libraries been added, updated, or removed?
- **Configuration:** Inspect environment variables and configuration files. Have any settings changed that would impact the system's behavior?

### **2. Memory Bank Update**

Based on your review, you MUST meticulously update **ALL** of the following Memory Bank files to reflect the current state of the project.

-   **`projectbrief.md`**:
    -   Verify if the high-level goals still align with the project's current trajectory. Note any significant deviations.
-   **`productContext.md`**:
    -   Update the "How it should work" section if the user experience or core functionality has changed.
-   **`techContext.md`**:
    -   Update the technology stack, dependencies, and development setup sections to be 100% accurate.
-   **`systemPatterns.md`**:
    -   Update the architecture diagrams and descriptions to reflect any refactoring, new patterns, or changes in component relationships.
-   **`activeContext.md`**:
    -   This file should be updated to reflect the *current* focus of development. What is being worked on right now?
-   **`progress.md`**:
    -   This is the most critical file to update.
    -   Scrub the "What Works" section to accurately represent the current, fully-functional parts of the application.
    -   Update "What's Left to Build" and "Known Issues" based on your fresh analysis.

### **3. Verification**

After completing the updates, confirm that the Memory Bank is a true and accurate mirror of the project's current state.
