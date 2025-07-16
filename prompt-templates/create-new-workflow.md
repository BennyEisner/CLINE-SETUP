# Prompt: Create New Workflow

**Objective:** To document a complex, multi-step process as a new workflow file in the `workflows/` directory, ensuring it can be followed consistently by any team member.

**Context:** A new process has been identified that needs to be standardized and documented. This could be a deployment process, a code review process, a testing procedure, or any other multi-step workflow that benefits from clear documentation.

---

### **1. Workflow Definition**

Your task is to define and document a new workflow.

-   **Workflow Name:** `[Provide a clear, descriptive name for the workflow, e.g., "Production Deployment Process."]`
-   **Workflow Purpose:** `[Briefly describe what this workflow accomplishes and when it should be used.]`
-   **Target Audience:** `[Who will be using this workflow? e.g., "Developers," "DevOps team," "QA testers."]`

### **2. Workflow Documentation**

Create a new markdown file in the appropriate subdirectory within `workflows/`. The file should include:

-   **Prerequisites:** What needs to be in place before starting this workflow? (e.g., "Code must be merged to main branch," "All tests must be passing.")
-   **Step-by-Step Instructions:** A numbered list of clear, actionable steps. Each step should:
    -   Be specific and unambiguous.
    -   Include any necessary commands, file paths, or configuration details.
    -   Specify who is responsible for the step (if applicable).
    -   Include expected outcomes or verification steps.
-   **Troubleshooting:** Common issues that might arise and how to resolve them.
-   **Success Criteria:** How to know when the workflow has been completed successfully.

### **3. File Organization**

Place the workflow file in the appropriate subdirectory:
-   `workflows/development/` for development-related processes
-   `workflows/deployment/` for deployment and release processes
-   `workflows/testing/` for testing procedures
-   Create new subdirectories as needed for other categories

### **4. Verification**

After creating the workflow documentation, confirm that:
-   The steps are clear and can be followed by someone unfamiliar with the process.
-   All necessary details are included.
-   The file is properly organized and easy to find.
