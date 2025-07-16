# Feature Branch Workflow

This workflow outlines the step-by-step process for developing a new feature, from creating a branch to merging it into the `develop` branch. It ensures that all work adheres to the Git standards defined in `clinerules-bank/02-git-workflow-standards.md`.

## 1. Pull the Latest Changes

Before starting any new work, ensure your local `develop` branch is up-to-date with the remote repository.

```bash
git checkout develop
git pull origin develop
```

## 2. Create a Feature Branch

Create a new branch from `develop`. The branch name must be prefixed with `feature/` followed by a short, descriptive name in kebab-case.

```bash
git checkout -b feature/your-feature-name
```

**Example:**

```bash
git checkout -b feature/user-profile-page
```

## 3. Implement the Feature

Write the code for the new feature. As you work, make small, logical commits.

## 4. Commit Changes with Conventional Commits

Each commit message must follow the Conventional Commits format.

```bash
git add .
git commit -m "feat(scope): your descriptive commit message"
```

**Example:**

```bash
git commit -m "feat(profile): create basic structure for user profile page"
```

For more complex changes that require a body, you can run `git commit` without the `-m` flag to open your editor:

```
feat(profile): add user data display

- Fetches user data from the API.
- Renders the user's name, email, and profile picture.
- Adds basic styling for the profile card.
```

## 5. Push the Feature Branch

Once the feature is complete and all changes are committed, push your branch to the remote repository.

```bash
git push -u origin feature/your-feature-name
```

## 6. Open a Pull Request

Navigate to the repository in your Git hosting platform (e.g., GitHub, GitLab) and open a new pull request.

- **Base Branch:** `develop`
- **Compare Branch:** `feature/your-feature-name`

Fill out the pull request template with a clear description of the changes, why they were made, and how to test them.

## 7. Code Review and Merge

After the pull request is approved by at least one team member, it can be merged into the `develop` branch. It is best practice to delete the feature branch after the merge is complete.
