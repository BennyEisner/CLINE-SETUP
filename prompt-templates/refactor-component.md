# Prompt: Refactor Component

**Objective:** To refactor a specific component (`[Specify Component Name]`) to improve its design, maintainability, performance, or to bring it in line with newly established system patterns.

**Context:** This component has been identified as a candidate for refactoring. The goal is not to add new functionality, but to improve the quality of the existing code.

---

### **1. Pre-Refactor Analysis**

Before making any changes, your first task is to analyze the target component and its role in the system.

-   **Component to Refactor:** `[Specify Component Name]`
-   **Location:** `[Path to Component]`
-   **Refactoring Goals:** `[List the specific goals, e.g., "Improve readability," "Reduce complexity by breaking into smaller pieces," "Replace local state with global store," "Align with the new 'Service Container' pattern."]`

Your analysis MUST:
-   Identify the key parts of the code that need to be changed to meet the refactoring goals.
-   Determine the potential impact of the changes on other parts of the system. What other components or services interact with this one?
-   Define a clear plan of action for the refactoring process.

### **2. Execute Refactoring**

Implement the planned changes to the component. You must ensure that:
-   All existing functionality remains intact and behaves as it did before the refactoring.
-   The changes strictly adhere to the project's coding standards and the stated refactoring goals.
-   The code is left in a cleaner, more maintainable state.

### **3. Post-Refactor Verification & Documentation**

After the refactoring is complete:
-   **Verify Functionality:** Manually test or run automated tests to confirm that the component still works correctly.
-   **Update Memory Bank:**
    -   **`memory-bank/activeContext.md`**: Briefly document the refactoring that was performed and why.
    -   **`memory-bank/progress.md`**: Update the "What Works" section to reflect the improved state of the component.
    -   **`memory-bank/systemPatterns.md`**: If the refactoring was done to align with a system pattern, ensure the component is now listed as a reference example for that pattern.

### **4. Final Confirmation**

Confirm that the refactoring goals have been met and that the component is in a better state than before.
