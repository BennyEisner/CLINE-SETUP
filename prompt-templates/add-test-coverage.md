# Prompt: Add Test Coverage

**Objective:** To increase the test coverage for a specific component or module by identifying untested code paths and writing new, meaningful tests.

**Context:** A specific part of the codebase has been identified as having insufficient test coverage, increasing the risk of regressions. This prompt initiates a focused effort to improve its test suite.

---

### **1. Test Coverage Analysis**

Your first task is to analyze the existing tests for the target component.

-   **Component/Module to Test:** `[Specify the component or file, e.g., "the `useUserData` hook," "the `api/auth.js` module."]`
-   **Location:** `[Path to the component and its corresponding test file.]`

Your analysis MUST:
-   Run the existing test suite with coverage reporting to identify which lines, branches, or functions are not currently tested.
-   Identify the most critical untested logic (e.g., error handling, edge cases, complex business logic).
-   Create a plan outlining the new test cases that need to be written.

### **2. Write New Tests**

Implement the new test cases as planned. Each new test should:
-   Follow the existing testing conventions and style.
-   Be well-named to clearly describe what it is testing.
-   Focus on a single, specific behavior or outcome.
-   Properly mock any external dependencies.

### **3. Verification**

After adding the new tests:
-   Run the entire test suite to ensure that all new and existing tests pass.
-   Re-run the coverage report to confirm that coverage has increased and that the critical paths identified in the analysis are now covered.
-   **Update Memory Bank:**
    -   **`memory-bank/progress.md`**: In the "What Works" section, note the improved test coverage for the component, making it more robust.

### **4. Final Confirmation**

Confirm that the component's test coverage is significantly improved and that the new tests provide meaningful validation of its functionality.
