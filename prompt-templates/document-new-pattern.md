# Prompt: Document New System Pattern

**Objective:** To identify, analyze, and document a new or emerging design/architectural pattern that is being used in the codebase.

**Context:** As a project evolves, new patterns emerge. It is critical to document these patterns in `systemPatterns.md` to ensure consistency and guide future development. This prompt initiates the process of formalizing a newly identified pattern.

---

### **1. Pattern Identification & Analysis**

Your primary task is to analyze and formally define a new pattern observed in the codebase.

-   **Pattern Name:** `[Give the pattern a clear, descriptive name]`
-   **Location(s) of Use:** `[Provide paths to one or more examples of this pattern in the code]`

Your analysis MUST cover the following:
-   **Problem Solved:** What specific problem does this pattern solve? Why was it introduced?
-   **Core Structure:** Describe the key components of the pattern and how they interact. A simple diagram or list of components is effective here.
-   **How it Works:** Explain the flow of data or control within the pattern.
-   **Trade-offs:** What are the benefits of using this pattern? What are the potential drawbacks or limitations?

### **2. Memory Bank Update**

Based on your analysis, you MUST update the following Memory Bank file:

-   **`memory-bank/systemPatterns.md`**:
    -   Add a new section for the newly documented pattern.
    -   Include the pattern's name, the problem it solves, a description of its structure, and its trade-offs.
    -   Provide a concise, illustrative code snippet that serves as a canonical example of the pattern.

### **3. Verification**

After updating the file, confirm that the new pattern is documented clearly enough for another developer to understand it and apply it correctly in a new context.
