# gitflow-cicd

Run

```
./setup-hooks.sh
```

TODOs:
1. Copy commitizen config
2. Copy config folder
3. Copy workflows (create RC release PR, create release, verify conventionalcommits)
4. Create first version tag (`cz bump`)
5. Create release label
6. Create branch protection rules
   1. PRs only
   2. Require 1 approval from codeowners
   3. Require conventionalcommits
   4. Require smoke tests
7. Master requires linear history
8. Disable Squash and merge

## Challenges

1. Feature branches should be merged with "Rebase and merge" GitHub button.
2. Release branches MUST be merged with "Create merge commit" GitHub button.

Using rebase or squash in release branches will rewrite commit hashes which will cause Git to lose track of what commits have already been release. Additionally, creates duplicate commits.

As long as we remember to use the correct buttons, we are safe. However, it would be great to configure GitHub different merge strategies on a branch level. This feature is requested in this [discussion](https://github.com/orgs/community/discussions/20583) and has many upvotes but there is no official response from GitHub team.

### **Current solution**
1. Disable `Squash and merge` as it should never be used.
2. Add a disclaimer message in the release PR body to pay special attention to this.
3. Optionally, we can create a GHA workflow that checks which type of merge has been used and reverts + reopens PR if it violates this constraint.