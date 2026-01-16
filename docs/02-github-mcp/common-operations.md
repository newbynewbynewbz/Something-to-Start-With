# Common GitHub MCP Operations

Once authenticated, here's what you can do with the GitHub MCP Server.

## Repository Operations

### List Your Repositories

```
> List my GitHub repositories
```

Claude will show repos you own or have access to.

### Read Repository Files

```
> Show me the README from owner/repo

> What's in the package.json of owner/repo?

> List files in the src/ directory of owner/repo
```

### Search Code

```
> Search for "TODO" in owner/repo

> Find all files containing "async function" in owner/repo
```

### Get Repository Info

```
> Tell me about the owner/repo repository

> What languages are used in owner/repo?

> Show recent commits in owner/repo
```

## Issue Operations

### List Issues

```
> Show open issues in owner/repo

> List issues labeled "bug" in owner/repo

> Find issues assigned to me in owner/repo
```

### Create an Issue

```
> Create an issue in owner/repo titled "Fix login bug" with body "The login button doesn't work on mobile"

> Create an issue in owner/repo:
  Title: Add dark mode
  Body: Users have requested dark mode support
  Labels: enhancement, ui
```

### Update an Issue

```
> Close issue #123 in owner/repo

> Add the "priority" label to issue #456 in owner/repo

> Assign issue #789 to username in owner/repo
```

### Search Issues

```
> Find issues mentioning "performance" in owner/repo

> Search for closed issues about "authentication" in owner/repo
```

## Pull Request Operations

### List Pull Requests

```
> Show open pull requests in owner/repo

> List PRs by username in owner/repo

> Find PRs ready for review in owner/repo
```

### Review a PR

```
> Show me the changes in PR #123 of owner/repo

> What files were modified in PR #456?

> Summarize PR #789 in owner/repo
```

### Get PR Details

```
> Who approved PR #123?

> Show comments on PR #456

> What's the status of checks on PR #789?
```

## Workflow Operations

### Check Actions Status

```
> Show recent workflow runs in owner/repo

> What's the status of the CI workflow in owner/repo?

> List failed workflows in owner/repo
```

## Combined Workflows

### Bug Investigation

```
> Find issues about "login" in owner/repo, then show me the relevant code in src/auth/
```

### PR Review Workflow

```
> Show me PR #123, explain what it does, and check if there are any issues it might cause
```

### Code Exploration

```
> I'm new to owner/repo. Give me an overview of the architecture based on the file structure and README
```

## Tips for Better Results

### Be Specific
```
# Good
> Show open issues labeled "bug" in owner/repo

# Vague
> Show me issues
```

### Use Full Repo Names
```
# Good
> List PRs in facebook/react

# Ambiguous
> List PRs in react
```

### Combine Operations
```
> Find the issue about dark mode, then show me related code in the UI components
```

## Error Messages

### "Repository not found"
- Check repo name spelling
- Verify you have access (private repos need proper token scopes)
- Format should be `owner/repo`

### "Rate limit exceeded"
- GitHub limits API calls
- Wait a few minutes
- Authenticated requests have higher limits

### "Resource not accessible"
- Token missing required scope
- You don't have permission for that repo
- Try with a public repository

## Practice Exercise

Try these operations on a public repository:

1. Get info about `octocat/Hello-World`
2. List its issues
3. Read the README
4. Search for "hello" in the code

```
> Tell me about octocat/Hello-World and show its README
```

## Next Steps

Ready for more? Try:
- [Exercise 1: Connect to GitHub](../../exercises/01-connect-github.md)
- [Additional Servers: Sentry](../03-more-servers/sentry-mcp.md)
