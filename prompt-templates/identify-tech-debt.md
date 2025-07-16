# Prompt: Identify and Document Technical Debt

**Objective:** To perform a targeted scan of a specific area of the codebase to identify, categorize, and document instances of technical debt.

**Context:** Technical debt slows down development and increases the risk of bugs. Proactively identifying and documenting it is the first step toward managing it. This prompt initiates a formal review process.

---

### **1. Technical Debt Analysis**

Your primary task is to analyze a specific part of the codebase to find instances of technical debt.

-   **Area to Analyze:** `[Specify the directory, component, or feature area to scan, e.g., "the entire /src/api/ directory," "the UserProfile component."]`
-   **Focus Areas (Optional):** `[List any specific types of tech debt to look for, e.g., "outdated dependencies," "lack of error handling," "magic strings," "insufficient test coverage."]`

For each instance of technical debt you identify, you must document:
-   **Location:** The specific file and line number(s).
-   **Description:** A clear and concise explanation of the problem.
-   **Impact:** The potential negative consequences of this debt (e.g., "makes the code hard to understand," "could lead to runtime errors," "slows down performance").
-   **Suggested Fix:** A high-level recommendation for how to resolve the debt.

### **2. Memory Bank Update**

Based on your analysis, you MUST update the following Memory Bank file:

-   **`memory-bank/progress.md`**:
    -   Add a new section under "Known Issues" titled "Technical Debt."
    -   For each identified item, create a new entry with its location, description, impact, and suggested fix. This creates a formal backlog of debt to be addressed.

### **3. Verification**

After updating the file, confirm that the technical debt has been clearly and accurately documented, providing enough detail for another developer to understand the issue and the proposed solution.
