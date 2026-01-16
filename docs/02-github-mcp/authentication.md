# GitHub MCP Authentication

To use the GitHub MCP Server, you need to authenticate. This guide covers the recommended approach: Personal Access Tokens (PATs).

## Creating a Personal Access Token

### Step 1: Go to GitHub Settings

1. Click your profile picture (top right)
2. Click **Settings**
3. Scroll down to **Developer settings** (left sidebar)
4. Click **Personal access tokens** → **Tokens (classic)**

Or go directly to: https://github.com/settings/tokens

### Step 2: Generate New Token

1. Click **Generate new token** → **Generate new token (classic)**
2. Give it a descriptive name: `MCP Learning Project`
3. Set expiration (90 days recommended for learning)

### Step 3: Select Scopes

For this learning project, select these scopes:

| Scope | Why Needed |
|-------|------------|
| `repo` | Access repositories (read/write) |
| `read:org` | List organizations you belong to |
| `read:packages` | Read package information |

For read-only access, you only need:
- `public_repo` (public repos only)
- `repo` (includes private repos)

### Step 4: Generate and Copy

1. Click **Generate token**
2. **COPY THE TOKEN NOW** - you won't see it again!

## Storing Your Token Securely

**Never put tokens directly in config files!**

### Option 1: Shell Environment (Recommended)

Add to `~/.zshrc` (macOS) or `~/.bashrc` (Linux):

```bash
# GitHub MCP Server Authentication
export GITHUB_PERSONAL_ACCESS_TOKEN="ghp_xxxxxxxxxxxxxxxxxxxx"
```

Then reload:
```bash
source ~/.zshrc
```

### Option 2: Claude Code Settings

Add to `~/.claude/settings.local.json`:

```json
{
  "env": {
    "GITHUB_PERSONAL_ACCESS_TOKEN": "ghp_xxxxxxxxxxxxxxxxxxxx"
  }
}
```

This file should **never** be committed to git.

## Using the Token in MCP Config

Your `.mcp.json` references the environment variable:

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

The `${GITHUB_PERSONAL_ACCESS_TOKEN}` syntax tells MCP to read from your environment.

## Verifying Authentication

### Check Token is Set

```bash
echo $GITHUB_PERSONAL_ACCESS_TOKEN
# Should display your token
```

### Test with Claude Code

```bash
claude --mcp-debug
```

Then ask:
```
> List my GitHub repositories
```

If authentication works, you'll see your repos. If not, check the debug output for errors.

## Troubleshooting

### "Bad credentials"
- Token may be expired - generate a new one
- Token may be revoked - check GitHub settings
- Wrong token copied - regenerate

### "Resource not accessible"
- Missing required scope - add `repo` scope
- Token doesn't have org access - request access or use personal repos

### "401 Unauthorized"
- Token not set in environment
- Typo in environment variable name
- Shell not reloaded after adding export

### Token Not Found in Environment
```bash
# Check if variable exists
env | grep GITHUB

# If empty, make sure you:
# 1. Added export to ~/.zshrc
# 2. Ran: source ~/.zshrc
# 3. Or opened a new terminal
```

## Token Best Practices

1. **Use minimal scopes** - only request what you need
2. **Set expiration** - don't use tokens that never expire
3. **Rotate regularly** - regenerate tokens periodically
4. **Never commit** - add `.env` to `.gitignore`
5. **Use separate tokens** - one per project/purpose

## Alternative: OAuth (Remote Server)

If using the remote GitHub MCP server:

1. Run `/mcp` in Claude Code
2. Select the GitHub server
3. Click "Authenticate"
4. Complete the OAuth flow in browser

This is simpler but requires the remote server setup.

## Next Steps

Token ready? Learn [Common Operations](common-operations.md) you can perform.
