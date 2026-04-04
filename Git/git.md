## Git set upstream
Git upstream is a link between the local repo and the remote one, and it enables you to synchronize the two repos.

    ## set and push changes on new remote
    git push --set-upstream <upstream URL> <upstream branch>

    e.g. git push --set-upstream https://github.com/Pravin-Ade/DevOps-Zone.git main

    ## set name
    git remote add <upstream name> <upstream URL>

    ## set on forked repo
    git remote add upstream <upstream URL>
    
``git push -u origin main``

1. **origin** refers to the remote repo's URL. origin, clone URL, or upstream can mean the same thing.

2. If we clone the repo, git links local and remote URLs, so we don't go through the lengthy upstream setup process. That is why you use git push without manually configuring the upstream.

3. -u is the short form of upstream. It points to the repo where we push or pull changes.

## Another way to set upstream
You can configure the upstream further by specifying the remote name using the command:

    syntax: git remote add <upstream name> <upstream URL>

    For example, we set our upstream name to the above URL like this:

    git remote add origin https://github.com/Pravin-Ade/DevOps-Zone.git

If you run into fatal: `remote origin already exists error`, use this command to remove the default origin

    git remote rm origin

check the changes

    git remote -v

---------------------------------------------

## What is HEAD in Git?

Where am I right now in the repository? It is a pointer to the currently checked-out branch or commit.

### Attached & detached state
HEAD pointer can be in either of two states: attached or detached. 

The default state is **attached**, where any manipulation of the history is automatically recorded to the branch HEAD is currently referencing. 

In a **detached** state, experimental changes can be made without impacting any existing branch, as HEAD is referencing the underlying commit directly and is not "attached" to a particular branch.

### Display commit graph in git

    git log --graph --decorate --oneline

### How to get all the parent commit ID from commit history in Git?

    git log --no-walk HEAD^@

- Here, we used **^@** to get all parents and the **--no-walk** option to show only the parents and not their ancestors. 

## How to get the parent details of any commit ID in git?

To get the parent ID of individual commits in Git:

    git log --pretty=%P -n 1 <commit id>

-------------------------------------------------

git stash
git reset
git 

### Git remove untracked file and directories from git:

    git clean -f
    git clean -fd

### unstage file from git

    git rm --cached <file>
    git restore --staged <file>
    git reset <file>

## How to delete branches (locally or remotely)

Delete branch locally

    git branch -d <branch name>

    if branch is note merged yet then use -D

Delete branch Remotely

    git push origin --delete <branch name

### Note: What if current branch not set as upstream

To push the current branch and set the remote as upstream, use

    git push --set-upstream origin <branch-name>
    git push --set-upstream origin feature
    
### Squash Git Commits

If you are working on a project and trying to implement a new feature, you might commit your code a few times to test things out. This lets you see how the code works or looks.

Because of this, you might want to combine all those commits into a single commit. This process is called commit squashing.

To see the commits

    git log --oneline

Tell the Git how far back you want to rebase.

**Note:** Note that I have two branches main and new-feature. i want to squash all the commits in the new-feature branch into one commit.

    git rebase -i HEAD~6

Now, you just need to replace all those pick with squash or s.

## Accidentally committed and pushed code to feature branch    

1. Identify the commit hash: use the git log command to find the commit hash 

  git log 
  git log --oneline

2. Revert to the previous commit
  
  git reset --hard <commit-hash>

3. Force push the changes to the remote branch

  git push origin <branch-name> --force

This will revert your branch to the previous state and update the remote branch accordingly.

