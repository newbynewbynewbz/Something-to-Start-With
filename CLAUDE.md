# MCP Learning Project

## Purpose
This is an interactive learning project for the Model Context Protocol (MCP).
It teaches users how to connect Claude Code to GitHub and other external services.

Target audience: Beginners and intermediate developers new to MCP.

## Project Structure
- `/docs/` - Tutorial documentation organized by topic
- `/examples/` - Working configuration files and helper scripts
- `/exercises/` - Hands-on practice exercises with step-by-step instructions

## MCP Servers Covered
- **github** - Repository operations, issues, pull requests
- **sentry** - Error monitoring and debugging
- **sqlite** - Database queries and operations
- **brave-search** - Web search capabilities

## Security Rules
IMPORTANT: Never commit tokens or API keys to this repository.

Use environment variables for all sensitive data:
- `GITHUB_PERSONAL_ACCESS_TOKEN` - GitHub PAT for authentication
- `BRAVE_API_KEY` - Brave Search API key
- `SENTRY_AUTH_TOKEN` - Sentry authentication token

Store personal tokens in `~/.zshrc` or `~/.bashrc`, not in project files.

## Key Commands
- `claude mcp list` - View configured MCP servers
- `claude mcp add` - Add a new MCP server
- `claude mcp remove` - Remove an MCP server
- `/mcp` - Manage servers interactively in Claude Code
- `claude --mcp-debug` - Debug MCP connection issues

## File Conventions
- Use kebab-case for filenames: `my-tutorial.md`
- Number sequential docs: `01-setup.md`, `02-auth.md`
- JSON configs use descriptive names: `github-basic.json`

## When Editing This Project
- Keep explanations beginner-friendly
- Include expected output in exercises
- Test all config examples before documenting
- Add troubleshooting tips for common errors

## Dependencies
- Node.js 18+ (required for npx commands)
- Claude Code CLI (installed globally)
- Git (for version control)
