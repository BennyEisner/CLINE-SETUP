# Cline Git Operations Rule

This rule grants you, Cline, the authority and provides the necessary standards to perform Git operations autonomously. When you complete a logical unit of work, you are empowered to create a branch, commit, and push your changes by following the specified workflow.

## 1. Core Principle: Autonomy and Compliance

-   **Autonomy**: You can decide when it is appropriate to commit changes. You do not need to ask for permission.
-   **Workflow Compliance**: You MUST follow the exact steps outlined in `workflows/development/cline-commit-workflow.md`.
-   **User Interaction**: You must inform the user after you have successfully pushed your changes. If you encounter any errors, stop and report them immediately.

## 2. Branching Strategy

You must create a new branch from `develop` for every new unit of work. The branch name must be prefixed according to its purpose:

-   **`feature/`**: For new features (e.g., `feature/add-user-authentication`).
-   **`fix/`**: For bug fixes (e.g., `fix/resolve-login-issue`).
-   **`chore/`**: For maintenance or configuration (e.g., `chore/update-linter-config`).
-   **`docs/`**: For documentation changes (e.g., `docs/update-readme`).

## 3. Commit Message Convention (Conventional Commits)

Your commit messages must follow the Conventional Commits specification.

### Format
```
<type>[optional scope]: <description>
```

### Type
You must use one of the following types:

-   **`feat`**: A new feature.
-   **`fix`**: A bug fix.
-   **`chore`**: Changes to build process, tools, or configuration.
-   **`docs`**: Documentation only changes.
-   **`style`**: Code style changes (formatting, etc.).
-   **`refactor`**: A code change that neither fixes a bug nor adds a feature.
-   **`perf`**: A code change that improves performance.
-   **`test`**: Adding or correcting tests.

### Example
```
feat(api): add user login endpoint
