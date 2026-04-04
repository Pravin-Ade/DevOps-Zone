### Q.1 How do you revert a bad commits that is already pushed to a shared branch?

- to get latest commit hash - _git reflog_
- then run _git revert [commit-hash]

### Q.2 How to squash a commit

- git rebase takes a sequence of commits and moves them to a new base commit.
- It rewrites commit history to make it linear and clean, avoiding unnecessary merge commits.

__When to use rebase__

1. Clean history - Remove unnecessary merge commits and make Git log simple
2. Prepare for PR review - Squash messy commits into a single meaningful commit 
3. 
