# Prompt: Deep Dive Component Analysis

**Objective:** To perform a deep and thorough analysis of a specific component (`[Specify Component Name]`) to enhance the accuracy of the Memory Bank, specifically focusing on its current state, progress, and internal workings.

**Context:** The initial Memory Bank setup provides a high-level overview. This task is to go a level deeper on a critical or complex component to ensure our understanding is precise and detailed.

---

### **1. Component Analysis**

Your primary task is to conduct an in-depth investigation of the `[Specify Component Name]` located at `[Path to Component]`.

Your analysis MUST cover the following areas:

-   **Core Responsibility:** What is the single most important purpose of this component?
-   **State Management:**
    -   How does it manage state? (e.g., local state, global store, hooks, services).
    -   What are the key state variables and their purposes?
-   **Props & Inputs:**
    -   What properties or inputs does it accept?
    -   How do these inputs influence its behavior and rendering?
-   **Key Logic & Operations:**
    -   Identify and document the most critical functions or methods.
    -   Describe the business logic or complex algorithms involved.
-   **Dependencies & Interactions:**
    -   What other components, services, or modules does it depend on?
    -   How does it interact with them? (e.g., function calls, events, data passing).
-   **Error Handling:** How does the component handle potential errors or edge cases?

### **2. Memory Bank Update**

Based on your analysis, you MUST update the following Memory Bank files:

-   **`memory-bank/activeContext.md`**:
    -   Add a new section detailing the `[Specify Component Name]`.
    -   Summarize your key findings, focusing on the component's role and behavior in the system.
    -   Document any immediate considerations or decisions that need to be made regarding this component.

-   **`memory-bank/progress.md`**:
    -   Update the "What Works" section with a detailed description of the component's implemented functionality.
    -   If applicable, add items to the "What's Left to Build" or "Known Issues" sections based on your findings (e.g., missing features, bugs, areas for improvement).

### **3. Verification**

After updating the Memory Bank, confirm that the new documentation accurately reflects the current state of the component and provides a solid foundation for future work.
