# Git Workflow Standards

To ensure a clean, navigable, and maintainable project history, all projects should adhere to the following Git workflow standards. This includes a structured branching model and a standardized commit message format.

## Branching Strategy

All work should be done on dedicated branches, not directly on the `main` branch. This isolates work, simplifies code reviews, and protects the stability of the main codebase.

- **`main`**: This branch represents the production-ready state of the project. Only tested and approved code should be merged into `main`.
- **`develop`**: This branch is the primary development branch, containing the latest delivered development changes for the next release.
- **Feature Branches**: All new features should be developed on branches prefixed with `feature/`.
  - Example: `feature/add-user-authentication`
- **Fix Branches**: Bug fixes should be developed on branches prefixed with `fix/`.
  - Example: `fix/resolve-login-issue`
- **Chore Branches**: Tasks related to project maintenance, configuration, or tooling should be on branches prefixed with `chore/`.
  - Example: `chore/update-linter-config`
- **Docs Branches**: Documentation-only changes should be on branches prefixed with `docs/`.
  - Example: `docs/update-readme`

## Commit Message Convention (Conventional Commits)

Commit messages must follow the [Conventional Commits specification](https://www.conventionalcommits.org/). This format provides a clear and explicit history, making it easier to automate changelog generation and versioning.

The commit message should be structured as follows:

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Type

The `<type>` must be one of the following:

- **`feat`**: A new feature for the user.
- **`fix`**: A bug fix for the user.
- **`chore`**: Changes to the build process or auxiliary tools and libraries such as documentation generation.
- **`docs`**: Documentation only changes.
- **`style`**: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc).
- **`refactor`**: A code change that neither fixes a bug nor adds a feature.
- **`perf`**: A code change that improves performance.
- **`test`**: Adding missing tests or correcting existing tests.
- **`ci`**: Changes to our CI configuration files and scripts.
- **`revert`**: Reverts a previous commit.

### Example

```
feat(auth): add password reset functionality

Implement the password reset flow, including token generation, email sending, and the password update form.

Closes #123
```

## Pull Request (PR) Process

1.  **Create a Branch**: Create a new branch from `develop` following the branching strategy.
2.  **Commit Changes**: Make your changes and commit them using the Conventional Commits format.
3.  **Push Branch**: Push your branch to the remote repository.
4.  **Open a Pull Request**: Open a PR from your branch to the `develop` branch.
5.  **Code Review**: At least one other team member must review and approve the PR.
6.  **Merge**: Once approved, the PR can be merged into `develop`.
