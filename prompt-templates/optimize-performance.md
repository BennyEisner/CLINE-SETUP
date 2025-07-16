# Prompt: Analyze and Optimize Performance

**Objective:** To analyze a specific feature or component for performance bottlenecks and then implement optimizations to improve its speed and efficiency.

**Context:** A specific part of the application has been identified as being potentially slow or inefficient. This prompt initiates a structured process to measure, analyze, and improve its performance.

---

### **1. Performance Analysis**

Your first task is to analyze the performance of the target feature or component.

-   **Feature/Component to Analyze:** `[Specify the feature, page, or component, e.g., "the data dashboard," "the image upload process."]`
-   **Performance Goals:** `[Define the specific, measurable goals, e.g., "Reduce page load time by 50%," "Decrease API response time to under 200ms," "Eliminate rendering jank during scrolling."]`

Your analysis MUST include:
-   **Benchmarking:** Establish a baseline measurement of the current performance. How slow is it now?
-   **Bottleneck Identification:** Use profiling tools or code analysis to identify the specific parts of the code that are causing the slowdown (e.g., slow database queries, large bundle sizes, inefficient algorithms, excessive re-renders).
-   **Optimization Plan:** Propose a clear plan of action with specific changes to address the identified bottlenecks.

### **2. Implement Optimizations**

Execute the optimization plan. This may involve:
-   Refactoring inefficient code.
-   Introducing caching.
-   Optimizing database queries.
-   Reducing asset sizes.
-   Lazy-loading components or data.

### **3. Post-Optimization Verification & Documentation**

After implementing the changes:
-   **Measure Performance:** Re-run the benchmarks to measure the performance improvement against the baseline.
-   **Verify Functionality:** Ensure that the optimization has not introduced any new bugs or broken existing functionality.
-   **Update Memory Bank:**
    -   **`memory-bank/activeContext.md`**: Document the performance optimizations that were made.
    -   **`memory-bank/progress.md`**: Update the "What Works" section to note the improved performance of the feature.

### **4. Final Confirmation**

Confirm that the performance goals have been met and that the feature is noticeably faster and more efficient.
