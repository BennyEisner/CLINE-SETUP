# Prompt: Create New .clinerule

**Objective:** To create a new, specific `.clinerule` that defines a clear, enforceable standard, convention, or best practice for this project.

**Context:** To maintain code quality and consistency across the project, we need to establish and document our standards as `.clinerules`. This task is to create a new rule that can be easily understood and followed.

---

### **1. Rule Definition & Placement**

Your primary task is to define a new `.clinerule` and place it in the correct directory so it can be activated.

- **Rule Name/Topic:** `[Specify a clear, concise name for the rule]`
- **File Name:** `[e.g., 03-api-error-handling.md]`

### **2. Rule Type (Placement)**

Before creating the file, ask the user to specify the rule type. This determines where the file will be saved.

- **General Rule**: Applies to all tasks.
  - **Location**: `clinerules-bank/`
- **Environment-Specific Rule**: Applies only when a specific environment is active.
  - **Location**: `clinerules-bank/environments/`

**Question for User**: "Should this be a (1) General rule, or (2) an Environment-specific rule? If it's for a specific environment, please provide the environment name (e.g., 'react', 'python')."

### **3. Rule Content**

The content of the `.clinerule` markdown file MUST include the following sections:

- **Title:** A clear, descriptive title for the rule (e.g., `# API Error Handling Standards`).
- **Principle/Goal:** A brief, high-level statement explaining _why_ this rule is important. What is the goal we are trying to achieve with it?
- **Rule Requirements:** A clear, actionable set of guidelines. Use bullet points or numbered lists for clarity.
  - These should be specific and unambiguous.
- **Good Example (Do This):**
  - Provide a concise, correct code snippet that demonstrates the rule being followed properly.
  - Briefly explain why this example is correct.
- **Bad Example (Don't Do This):**
  - Provide a concise code snippet that shows a violation of the rule.
  - Briefly explain why this example is incorrect.

### **4. Verification**

After creating the file, confirm that the rule is well-defined, the examples are clear, and the documentation is easy to understand for any developer working on this project.
