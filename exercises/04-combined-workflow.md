# Exercise 4: Combined Multi-Server Workflow

Put it all together! Use multiple MCP servers in a single workflow.

## Objective

Complete a realistic debugging workflow using GitHub, Sentry, and web search.

## Prerequisites

- [ ] Completed Exercises 1-3
- [ ] GitHub MCP configured
- [ ] At least one other MCP server (Sentry, SQLite, or Brave Search)

## Time: ~20 minutes

---

## Setup: Full Configuration

For this exercise, use the multi-server configuration. Copy from `examples/configs/multi-server.json` or update your `.mcp.json`:

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-github",
        "--toolsets",
        "repos,issues,pull_requests"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_PERSONAL_ACCESS_TOKEN}"
      }
    },
    "sentry": {
      "command": "npx",
      "args": ["-y", "mcp-remote@latest", "https://mcp.sentry.dev/mcp"]
    },
    "brave-search": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-brave-search"],
      "env": {
        "BRAVE_API_KEY": "${BRAVE_API_KEY}"
      }
    }
  }
}
```

Restart Claude Code to load all servers.

---

## Scenario 1: Research and Implement

You want to add a feature but need to research best practices first.

### Step 1: Research
```
> Search the web for "best practices for JWT authentication in Node.js 2024"
```

### Step 2: Find Examples
```
> Search GitHub for popular repos implementing JWT authentication in Node.js
```

### Step 3: Create a Task
```
> Create an issue in YOUR_USERNAME/YOUR_REPO titled "Implement JWT Authentication"
  with a body summarizing the best practices you found
```

### Expected Flow

1. Brave Search returns current articles and guides
2. GitHub search finds real implementation examples
3. An issue is created with researched context

---

## Scenario 2: Debug a Production Error

Simulate debugging with Sentry and GitHub.

### Step 1: Find the Error
```
> Show the most recent unresolved error from Sentry
```

### Step 2: Locate the Code
```
> Based on that error's stack trace, find the relevant code in my GitHub repository
```

### Step 3: Research the Fix
```
> Search the web for how to fix this type of error
```

### Step 4: Document
```
> Create a GitHub issue describing this bug and the proposed fix
```

---

## Scenario 3: Code Review Assistance

Use MCP to help review a pull request.

### Step 1: Get PR Details
```
> Show me the changes in PR #X of owner/repo
```

### Step 2: Research Patterns
```
> Search the web for best practices related to the code changes in this PR
```

### Step 3: Check for Issues
```
> Are there any open issues related to the code being changed in this PR?
```

### Step 4: Provide Feedback
```
> Based on your analysis, what feedback would you give on this PR?
```

---

## Scenario 4: Learning a New Codebase

Quickly understand an unfamiliar repository.

### Step 1: Overview
```
> Give me an overview of the facebook/react repository structure
```

### Step 2: Recent Activity
```
> Show recent commits and pull requests in facebook/react
```

### Step 3: Documentation
```
> Search the web for React architecture documentation and guides
```

### Step 4: Deep Dive
```
> Show me how hooks are implemented in the React codebase
```

---

## Verification Checklist

Complete at least one scenario:

- [ ] Used multiple MCP servers in a single workflow
- [ ] Combined web search with GitHub data
- [ ] Created actionable output (issue, summary, etc.)

## Challenge: Build Your Own Workflow

Design a workflow for your actual work:

1. **Identify the task**: What do you need to do?
2. **Map the servers**: Which MCP servers help?
3. **Sequence the steps**: What order makes sense?
4. **Test it**: Does it work smoothly?

Example workflows:
- "Morning standup": Check Sentry errors → Review open PRs → Search for blockers
- "Feature planning": Research best practices → Find examples → Create issues
- "Bug triage": Get Sentry errors → Find related code → Prioritize by impact

---

## Tips for Effective Multi-Server Workflows

### 1. Be Explicit About Sources
```
# Good
> Search the web for React testing best practices, then find examples in popular GitHub repos

# Vague
> Find React testing info
```

### 2. Chain Results
```
> Based on the Sentry error you just showed me, search GitHub for similar issues in that repo
```

### 3. Summarize and Act
```
> Summarize what you found and create a GitHub issue with the key points
```

### 4. Use Context
```
> Given the PR changes and the web search results, are there any security concerns?
```

---

## What You Learned

- How to combine multiple MCP servers
- Real-world debugging workflows
- Research → Implement → Document patterns
- Efficient use of AI + external tools

## Congratulations!

You've completed the MCP Learning Project exercises! You now know how to:

- Configure MCP servers
- Authenticate with external services
- Query GitHub, Sentry, and web search
- Combine tools for powerful workflows

## Next Steps

- Explore the [MCP Server Registry](https://github.com/modelcontextprotocol/servers)
- Build custom MCP servers for your tools
- Share your workflows with your team
