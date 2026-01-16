# GitHub MCP Server Overview

The GitHub MCP Server lets Claude interact directly with GitHub repositories, issues, pull requests, and more.

## What You Can Do

| Feature | Examples |
|---------|----------|
| **Repositories** | List repos, read files, search code |
| **Issues** | Create, update, list, search issues |
| **Pull Requests** | Review PRs, list changes, add comments |
| **Actions** | View workflow runs, check status |
| **Code Search** | Find code across repositories |

## Installation Options

### Option 1: Local Server (Recommended for Learning)

Runs on your machine using npx:

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_PERSONAL_ACCESS_TOKEN}"
      }
    }
  }
}
```

**Pros:**
- Full control over the server
- Works offline (after initial download)
- All toolsets available

**Cons:**
- Requires Node.js
- Uses local resources

### Option 2: Remote Server (Easier Setup)

Connect to GitHub's hosted MCP endpoint:

```bash
claude mcp add --transport http github https://api.githubcopilot.com/mcp/
```

Then authenticate via `/mcp` in Claude Code.

**Pros:**
- No local setup
- Managed by GitHub

**Cons:**
- Requires internet
- OAuth flow for auth

## Available Toolsets

The GitHub MCP Server groups tools into "toolsets" you can enable:

| Toolset | Tools Included |
|---------|----------------|
| `repos` | List repos, read files, create/update files |
| `issues` | Create, update, list, search issues |
| `pull_requests` | List PRs, get details, review changes |
| `actions` | List workflows, get run status |
| `code_security` | Security advisories, alerts |
| `discussions` | GitHub Discussions |

### Enable Specific Toolsets

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-github",
        "--toolsets", "repos,issues,pull_requests"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_PERSONAL_ACCESS_TOKEN}"
      }
    }
  }
}
```

## Quick Test

After setup, try these in Claude Code:

```
> List my GitHub repositories

> Show open issues in owner/repo

> What's in the README of owner/repo?
```

## Security Modes

### Read-Only Mode
Safe for exploration - can't modify anything:

```json
"args": ["-y", "@modelcontextprotocol/server-github", "--read-only"]
```

### Lockdown Mode
Recommended for enterprise - disable write operations by default.

## Next Steps

1. [Set up authentication](authentication.md) - Create your GitHub token
2. [Common operations](common-operations.md) - Learn the most useful commands
