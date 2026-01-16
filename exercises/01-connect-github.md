# Exercise 1: Connect to GitHub

In this exercise, you'll set up your first MCP connection to GitHub.

## Objective

Successfully connect Claude Code to GitHub and list your repositories.

## Prerequisites

- [ ] Node.js 18+ installed
- [ ] Claude Code installed
- [ ] GitHub account

## Time: ~10 minutes

---

## Step 1: Create a Personal Access Token

1. Go to [github.com/settings/tokens](https://github.com/settings/tokens)
2. Click **Generate new token** → **Generate new token (classic)**
3. Name it: `MCP Learning`
4. Set expiration: 90 days
5. Select scopes:
   - [x] `repo` (Full control of private repositories)
   - [x] `read:org` (Read org membership)
6. Click **Generate token**
7. **Copy the token immediately** (you won't see it again!)

## Step 2: Set Your Environment Variable

Open your terminal and run:

```bash
# Add to your shell profile
echo 'export GITHUB_PERSONAL_ACCESS_TOKEN="YOUR_TOKEN_HERE"' >> ~/.zshrc

# Replace YOUR_TOKEN_HERE with your actual token!

# Reload the profile
source ~/.zshrc
```

Verify it's set:
```bash
echo $GITHUB_PERSONAL_ACCESS_TOKEN
# Should display your token
```

## Step 3: Verify MCP Configuration

Check that `.mcp.json` exists in this project:

```bash
cat .mcp.json
```

You should see:
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

## Step 4: Launch Claude Code

Start Claude Code with MCP debugging:

```bash
claude --mcp-debug
```

Watch for connection messages. You should see the GitHub server starting.

## Step 5: Test the Connection

In Claude Code, type:

```
> List my GitHub repositories
```

### Expected Output

You should see a list of your GitHub repositories with names, descriptions, and visibility (public/private).

---

## Verification Checklist

- [ ] Token created with correct scopes
- [ ] Environment variable set and accessible
- [ ] Claude Code starts without errors
- [ ] "List my repositories" returns results

## Try These Next

After successful connection, try:

```
> Show me my most recently updated repository

> How many public repos do I have?

> What languages do I use most across my repos?
```

## Troubleshooting

### "Bad credentials" Error

**Cause**: Token is invalid or expired

**Fix**:
1. Check token at github.com/settings/tokens
2. Regenerate if needed
3. Update your environment variable

### "No repositories found"

**Cause**: Token doesn't have access

**Fix**:
1. Ensure `repo` scope is selected
2. Check if you have any repositories
3. Try with a public repo: `> Show info about octocat/Hello-World`

### Claude Code won't start

**Cause**: Node.js issue

**Fix**:
```bash
node --version  # Must be 18+
npx --version   # Should work
```

### Token not found

**Cause**: Environment variable not set

**Fix**:
```bash
# Check if set
env | grep GITHUB

# If empty, re-add and reload
source ~/.zshrc
```

---

## What You Learned

- How to create a GitHub Personal Access Token
- How to securely store tokens in environment variables
- How MCP configuration works in `.mcp.json`
- How to verify MCP server connections

## Next Exercise

Ready for more? Continue to [Exercise 2: Create an Issue](02-create-issue.md).
