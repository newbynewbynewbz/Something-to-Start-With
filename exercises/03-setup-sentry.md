# Exercise 3: Setup Sentry MCP

Add error monitoring capabilities by connecting to Sentry.

## Objective

Configure the Sentry MCP server and explore error data.

## Prerequisites

- [ ] Completed Exercise 1 (understand MCP basics)
- [ ] A Sentry account (free tier works)

## Time: ~15 minutes

---

## Step 1: Create a Sentry Account

If you don't have Sentry:

1. Go to [sentry.io/signup](https://sentry.io/signup/)
2. Create a free account
3. Create an organization and project (any platform)

## Step 2: Add Sentry to Your MCP Config

Edit your `.mcp.json` to add Sentry:

```json
{
  "mcpServers": {
    "github": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-github"],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_PERSONAL_ACCESS_TOKEN}"
      }
    },
    "sentry": {
      "command": "npx",
      "args": ["-y", "mcp-remote@latest", "https://mcp.sentry.dev/mcp"]
    }
  }
}
```

This uses Sentry's remote MCP server with OAuth authentication.

## Step 3: Restart Claude Code

Exit and restart:

```bash
claude --mcp-debug
```

Watch for both GitHub and Sentry servers starting.

## Step 4: Authenticate with Sentry

In Claude Code, run:

```
> /mcp
```

Select the Sentry server and choose "Authenticate". Complete the OAuth flow in your browser.

## Step 5: Explore Sentry Data

After authentication, try:

```
> Show recent errors in Sentry

> What projects do I have in Sentry?

> List unresolved issues in my Sentry org
```

### Expected Output

If you have errors in Sentry, you'll see them listed. If not, you'll see "No errors found" or similar.

## Step 6: Generate a Test Error (Optional)

If you have a project set up, you can generate a test error:

**JavaScript example:**
```javascript
// In any JS project with Sentry SDK
Sentry.captureException(new Error("Test error from MCP learning"));
```

Then check:
```
> Show the most recent error in Sentry
```

---

## Alternative: Local Sentry Server

For more control, use the local server with an auth token:

### Get a Sentry Auth Token

1. Go to [sentry.io/settings/auth-tokens](https://sentry.io/settings/auth-tokens/)
2. Click **Create New Token**
3. Select scopes: `project:read`, `event:read`, `org:read`
4. Copy the token

### Set Environment Variable

```bash
echo 'export SENTRY_AUTH_TOKEN="sntrys_YOUR_TOKEN"' >> ~/.zshrc
source ~/.zshrc
```

### Update Config

```json
{
  "mcpServers": {
    "sentry": {
      "command": "npx",
      "args": ["-y", "@sentry/mcp-server@latest"],
      "env": {
        "SENTRY_AUTH_TOKEN": "${SENTRY_AUTH_TOKEN}",
        "SENTRY_ORG_SLUG": "your-org-slug"
      }
    }
  }
}
```

Find your org slug in your Sentry URL: `sentry.io/organizations/YOUR-ORG-SLUG/`

---

## Verification Checklist

- [ ] Sentry server added to `.mcp.json`
- [ ] Claude Code starts with both servers
- [ ] Authenticated with Sentry (via OAuth or token)
- [ ] Can query Sentry data

## Combined Workflow: Debug with Sentry + GitHub

Try this powerful workflow:

```
> Find the most recent error in Sentry, then search my GitHub repos for related code
```

Claude will:
1. Get the error from Sentry
2. Analyze the stack trace
3. Search GitHub for the relevant code
4. Suggest fixes

---

## Troubleshooting

### "Organization not found"

**Cause**: Wrong org slug

**Fix**: Check your Sentry URL for the correct slug

### "Authentication failed"

**Cause**: OAuth didn't complete or token invalid

**Fix**:
- Try `/mcp` again and re-authenticate
- Or use token-based auth instead

### No errors showing

**Cause**: No errors in your Sentry project

**Fix**:
- Generate a test error
- Or just verify the connection works with "list projects"

---

## What You Learned

- How to add multiple MCP servers
- OAuth vs token authentication
- How to query error monitoring data
- Combining MCP servers for powerful workflows

## Next Exercise

Continue to [Exercise 4: Combined Workflow](04-combined-workflow.md) to use all servers together.
