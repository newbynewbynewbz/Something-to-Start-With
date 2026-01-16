# Exercise 2: Create a GitHub Issue

Now that you're connected, let's create an issue using MCP.

## Objective

Create, update, and manage a GitHub issue entirely through Claude Code.

## Prerequisites

- [ ] Completed Exercise 1 (GitHub connected)
- [ ] A repository you own (we'll create a test one if needed)

## Time: ~10 minutes

---

## Step 1: Identify Your Test Repository

You need a repository to create issues in. Options:

**Option A: Use an existing repo**
```
> List my repositories
```
Pick one you own.

**Option B: Create a test repo**
Go to [github.com/new](https://github.com/new) and create a repo called `mcp-test`.

For this exercise, we'll use `YOUR_USERNAME/mcp-test`. Replace with your actual repo.

## Step 2: View Existing Issues

First, let's see what issues exist:

```
> Show open issues in YOUR_USERNAME/mcp-test
```

### Expected Output

Either a list of issues or "No open issues found."

## Step 3: Create Your First Issue

Ask Claude to create an issue:

```
> Create an issue in YOUR_USERNAME/mcp-test with:
  Title: Test MCP Integration
  Body: This issue was created using the GitHub MCP Server.
  Labels: documentation
```

### Expected Output

Claude will confirm the issue was created and provide the issue number.

## Step 4: Verify the Issue

Check that it was created:

```
> Show issue #1 in YOUR_USERNAME/mcp-test
```

Or visit your repo on GitHub to see it.

## Step 5: Update the Issue

Let's modify the issue:

```
> Add a comment to issue #1 in YOUR_USERNAME/mcp-test saying "This comment was also added via MCP!"
```

Then:

```
> Add the "enhancement" label to issue #1 in YOUR_USERNAME/mcp-test
```

## Step 6: Close the Issue

When done:

```
> Close issue #1 in YOUR_USERNAME/mcp-test
```

---

## Verification Checklist

- [ ] Listed existing issues (or confirmed none exist)
- [ ] Created a new issue with title and body
- [ ] Added a comment to the issue
- [ ] Added a label to the issue
- [ ] Closed the issue

## Challenge Tasks

Try these more advanced operations:

### Create a detailed issue
```
> Create an issue in YOUR_USERNAME/mcp-test:
  Title: Implement dark mode
  Body: |
    ## Description
    Add dark mode support to the application.

    ## Requirements
    - Toggle in settings
    - Persist preference
    - Support system preference

    ## Acceptance Criteria
    - [ ] Toggle works
    - [ ] Preference saved
    - [ ] Looks good
  Labels: enhancement, ui
```

### Search issues
```
> Find all issues mentioning "bug" in YOUR_USERNAME/mcp-test
```

### Bulk operations
```
> Show all open issues in YOUR_USERNAME/mcp-test and summarize them
```

---

## Troubleshooting

### "Resource not accessible"

**Cause**: Token doesn't have write access

**Fix**:
- Ensure `repo` scope on your token
- Verify you own the repository

### "Validation failed"

**Cause**: Invalid label or missing required field

**Fix**:
- Check label exists in the repo
- Ensure title is provided

### Issue not appearing on GitHub

**Cause**: Created in wrong repo

**Fix**:
- Double-check the repo name
- Use full `owner/repo` format

---

## What You Learned

- How to list issues in a repository
- How to create issues with titles, bodies, and labels
- How to add comments to issues
- How to update issue metadata (labels)
- How to close issues

## Next Exercise

Ready to expand? Continue to [Exercise 3: Setup Sentry](03-setup-sentry.md).
