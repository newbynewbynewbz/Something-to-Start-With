# Setup Prerequisites

Before using MCP servers, you need a few things installed.

## Required Software

### 1. Node.js (v18 or higher)

MCP servers run via `npx`, which requires Node.js.

**Check if installed:**
```bash
node --version
# Should show v18.x.x or higher
```

**Install Node.js:**
- macOS: `brew install node`
- Windows: [Download from nodejs.org](https://nodejs.org/)
- Linux: `sudo apt install nodejs npm`

### 2. Claude Code CLI

The Claude Code command-line tool is the MCP client.

**Check if installed:**
```bash
claude --version
```

**Install Claude Code:**
```bash
npm install -g @anthropic-ai/claude-code
```

### 3. Git (Optional but Recommended)

For version control and GitHub operations.

**Check if installed:**
```bash
git --version
```

## Configuration Files

MCP servers are configured in JSON files. Here's where they live:

| File | Scope | Use Case |
|------|-------|----------|
| `.mcp.json` | Project | Shared with team, committed to git |
| `~/.claude.json` | User | Personal servers, all projects |
| `.claude/settings.local.json` | Local | Personal overrides, not committed |

### Priority Order
When the same server is defined in multiple places:
1. Local (highest priority)
2. Project
3. User (lowest priority)

## Your First Configuration

Create a `.mcp.json` file in your project root:

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

### Understanding the Config

- `"github"` - Name you'll use to reference this server
- `"command"` - Program to run (`npx`)
- `"args"` - Arguments passed to the command
- `"-y"` - Auto-confirm npx prompts
- `"env"` - Environment variables passed to the server
- `${VAR}` - References your shell environment variable

## Environment Variables

MCP servers often need API keys. **Never hardcode them!**

Add to your shell profile (`~/.zshrc` or `~/.bashrc`):

```bash
# GitHub MCP Server
export GITHUB_PERSONAL_ACCESS_TOKEN="ghp_xxxxxxxxxxxx"

# Brave Search (if using)
export BRAVE_API_KEY="BSA_xxxxxxxxxxxx"
```

Then reload:
```bash
source ~/.zshrc
```

## Verify Your Setup

Run these commands to check everything works:

```bash
# Check Node.js
node --version

# Check Claude Code
claude --version

# Check your token is set
echo $GITHUB_PERSONAL_ACCESS_TOKEN
# Should show your token (or at least not be empty)
```

## Common Issues

### "npx: command not found"
Node.js isn't installed or not in PATH. Reinstall Node.js.

### "Permission denied"
On macOS/Linux, you may need:
```bash
sudo npm install -g @anthropic-ai/claude-code
```

### Token Not Found
Make sure you:
1. Added the export to your shell profile
2. Ran `source ~/.zshrc` (or opened a new terminal)
3. Used the correct variable name

## Next Steps

Now you're ready to connect to GitHub! Continue to [GitHub MCP Overview](../02-github-mcp/overview.md).
