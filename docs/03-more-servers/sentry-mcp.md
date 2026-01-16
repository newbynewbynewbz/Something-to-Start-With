# Sentry MCP Server

Sentry is an error monitoring platform. The Sentry MCP Server lets Claude access error data, helping you debug issues faster.

## What You Can Do

- View recent errors and exceptions
- Get stack traces and error context
- Search for specific error types
- Analyze error patterns
- Get AI-powered fix suggestions

## Setup Options

### Option 1: Remote Server (Recommended)

Connect to Sentry's hosted MCP endpoint - no API key needed initially:

```json
{
  "mcpServers": {
    "sentry": {
      "command": "npx",
      "args": ["-y", "mcp-remote@latest", "https://mcp.sentry.dev/mcp"]
    }
  }
}
```

Then authenticate via `/mcp` in Claude Code using OAuth.

### Option 2: Local Server with Token

For more control, run locally with an auth token:

```json
{
  "mcpServers": {
    "sentry": {
      "command": "npx",
      "args": ["-y", "@sentry/mcp-server@latest"],
      "env": {
        "SENTRY_AUTH_TOKEN": "${SENTRY_AUTH_TOKEN}",
        "SENTRY_ORG_SLUG": "your-organization"
      }
    }
  }
}
```

## Getting a Sentry Auth Token

1. Go to [sentry.io](https://sentry.io) and log in
2. Navigate to **Settings** → **Auth Tokens**
3. Click **Create New Token**
4. Select scopes: `project:read`, `event:read`
5. Copy the token

Add to your shell profile:
```bash
export SENTRY_AUTH_TOKEN="sntrys_xxxxxxxxxxxx"
```

## Common Operations

### View Recent Errors

```
> Show recent errors in my Sentry project

> What exceptions happened in the last hour?
```

### Get Error Details

```
> Show me the stack trace for error ID abc123

> What's causing the "TypeError: undefined" errors?
```

### Search Errors

```
> Find errors related to "database connection"

> Show errors from the authentication module
```

### Debugging Workflow

```
> I'm getting a NullPointerException in production.
  Find related errors in Sentry and suggest a fix.
```

## Example Workflow: Debug a Bug

1. **Find the error:**
   ```
   > Show recent unresolved errors in Sentry
   ```

2. **Get context:**
   ```
   > Show me the full stack trace and user context for error xyz
   ```

3. **Find the code:**
   ```
   > Now show me the relevant code in my GitHub repo
   ```

4. **Get a fix:**
   ```
   > Suggest a fix for this error
   ```

## Configuration Reference

Full config with all options:

```json
{
  "mcpServers": {
    "sentry": {
      "command": "npx",
      "args": ["-y", "@sentry/mcp-server@latest"],
      "env": {
        "SENTRY_AUTH_TOKEN": "${SENTRY_AUTH_TOKEN}",
        "SENTRY_ORG_SLUG": "my-org",
        "SENTRY_PROJECT_SLUG": "my-project"
      }
    }
  }
}
```

| Variable | Required | Description |
|----------|----------|-------------|
| `SENTRY_AUTH_TOKEN` | Yes | Your Sentry API token |
| `SENTRY_ORG_SLUG` | Yes | Your organization slug |
| `SENTRY_PROJECT_SLUG` | No | Filter to specific project |

## Troubleshooting

### "Organization not found"
- Check your `SENTRY_ORG_SLUG` matches your Sentry org
- Find it in your Sentry URL: `sentry.io/organizations/YOUR-ORG/`

### "Permission denied"
- Token missing required scopes
- You're not a member of that organization

### No errors showing
- Check the project has errors
- Verify time range (recent errors only)

## Next Steps

- [SQLite MCP](sqlite-mcp.md) - Query databases
- [Brave Search MCP](brave-search-mcp.md) - Web search
- [Exercise: Setup Sentry](../../exercises/03-setup-sentry.md)
