# Contributing Guide

## Branching Strategy: Git Flow

We use the [Git Flow](https://nvie.com/posts/a-successful-git-branching-model/) branching model. Please follow these guidelines for branching and merging:

### Branches

- **`develop`**:
  - This is our main development branch. All feature branches should branch off from here and must be merged back into `develop` once development is completed.
  
- **`master`**:
  - This branch represents the production-ready state. Only release branches or hotfix branches can be merged into `master`.

- **Feature branches** (`feature/*`):
  - For every new feature or enhancement, create a new branch from `develop`.
  - Naming convention: `feature/<issue-id>-<description-of-feature>`.

- **Release branches** (`release/*`):
  - When `develop` has enough features for a release (or a scheduled release date is approaching), cut a release branch off from `develop`.
  - Naming convention: `release/X.Y.Z`.
  - Versioning uses semver.

- **Hotfix branches** (`hotfix/*`):
  - If a critical issue is identified in `master`, create a hotfix branch to address the issue.
  - Naming convention: `hotfix/<issue-id>-<description-of-hotfix>`.

### Workflow

1. **For new features:**
   - Branch off from `develop`: `git checkout -b feature/your-feature-name develop`
   - Once development is complete, open a pull request from your feature branch to `develop`.

2. **For releases:**
   - Create a release by triggering the `Release Candidate` GitHub Actions workflow.
   - This will create branch `release/X.Y.Z` and open a PR into `master`.
   - Changelog preview is automatically generated and updated on every commit on the release branch. It gets posted as pull request body
   - Once the release is ready to go live, merge the pull request.
   - Pushes on `master` will trigger the `Create Release` workflow which will:
     - Publish a GitHub release
     - Create a `X.Y.Z` tag
     - Backmerge into develop

3. **For hotfixes:**
   - Branch off from `master`: `git checkout -b hotfix/your-hotfix-name master`.
   - Create a pull request into `master` and merge once the fix is ready.
   - As mentioned in previous section, pushes on `master` will trigger a new release creation and backmerge to develop.

**Note:** Direct commits to `develop` and `master` are prohibited. Ensure all changes enter these branches through a pull request to maintain the integrity of the release history.

## Commit Message Format

All commit messages should follow the [Conventional Commits](https://www.conventionalcommits.org) standard. This includes a prefix identifying the type of change being made (e.g., `feat`, `fix`, `docs`, etc.), followed by a clear and succinct description of the change:

Example commit messages:
- `feat: add beta sequence`
- `fix: sonar memory issues`

For more detailed examples, visit the [Conventional Commits](https://www.conventionalcommits.org) documentation.

**Note:** This convention is ensured by the `Commit Linter` workflow. A successful run is required by `master` and `develop` branch protection rules.

## Pull Requests

- Include a brief description of the changes in the pull request. Use the default pull request template.
- Reference any relevant issue numbers related to the pull request.
- Ensure your code follows the established code standards and passes all continuous integration checks.
- Require linear history.

Following these guidelines helps maintain the quality of the project and ensures a smooth contribution process for all participants.