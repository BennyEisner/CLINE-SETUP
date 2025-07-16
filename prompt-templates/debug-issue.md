# Prompt: Debug and Fix Issue

**Objective:** To systematically investigate, identify the root cause of, and fix a reported bug or issue in the codebase.

**Context:** A bug has been reported, and its cause is currently unknown. This prompt provides a structured process for debugging and resolving the issue.

---

### **1. Issue Definition and Reproduction**

Your first task is to fully understand and reproduce the issue.

-   **Issue Description:** `[Provide a clear, detailed description of the bug. What is happening vs. what is expected?]`
-   **Reproduction Steps:** `[Provide a precise, step-by-step guide to reliably reproduce the bug.]`
-   **Environment:** `[Specify the environment where the bug occurs, e.g., "Chrome on macOS," "Production server."]`

Based on this information, you MUST:
-   Follow the steps to reproduce the bug yourself.
-   Use browser developer tools, logs, or other debugging tools to gather initial clues (e.g., error messages, failed network requests).

### **2. Root Cause Analysis**

Once you can reproduce the bug, your next task is to find its root cause.
-   Form a hypothesis about the cause of the bug.
-   Use debugging techniques (e.g., setting breakpoints, adding log statements, inspecting variables) to test your hypothesis.
-   Trace the code execution to pinpoint the exact location of the error.
-   Clearly state the root cause of the issue once identified.

### **3. Implement the Fix**

With the root cause understood, implement a fix. The fix should:
-   Directly address the root cause.
-   Be as targeted as possible to avoid unintended side effects.
-   Adhere to all project coding standards and `.clinerules`.

### **4. Verification and Documentation**

After implementing the fix:
-   **Verify the Fix:** Follow the original reproduction steps to confirm that the bug is no longer present.
-   **Regression Test:** Briefly check related functionality to ensure the fix has not introduced any new problems.
-   **Write a Test Case:** If possible, write a new automated test that specifically targets the bug. This test should have failed before the fix and should pass now, preventing future regressions.
-   **Update Memory Bank:**
    -   **`memory-bank/progress.md`**:
        -   If the issue was tracked in "Known Issues," move it to a "Resolved Issues" section or remove it, noting the fix.
        -   Update the "What Works" section to reflect that the previously buggy functionality is now stable.

### **5. Final Confirmation**

Confirm that the bug is resolved, the fix is verified, and the documentation is updated.
