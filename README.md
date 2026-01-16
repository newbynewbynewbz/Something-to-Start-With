# MCP Learning Project

Learn how to use the Model Context Protocol (MCP) to connect Claude Code to GitHub and other services.

## What You'll Learn

- What MCP is and why it matters
- How to configure MCP servers in Claude Code
- Connecting to GitHub for repository operations
- Integrating with Sentry, SQLite, and Brave Search
- Best practices for security and configuration

## Quick Start

### 1. Prerequisites

- [Node.js 18+](https://nodejs.org/)
- [Claude Code](https://claude.ai/code) installed globally
- A GitHub account

### 2. Set Up GitHub Token

1. Go to [GitHub Settings > Tokens](https://github.com/settings/tokens)
2. Generate a new token (classic) with scopes: `repo`, `read:org`
3. Add to your shell profile:

```bash
export GITHUB_PERSONAL_ACCESS_TOKEN="your_token_here"
```

### 3. Clone and Configure

```bash
git clone https://github.com/newbynewbynewbz/Something-to-Start-With.git
cd Something-to-Start-With
```

The `.mcp.json` file is already configured. Just run:

```bash
claude
```

### 4. Test the Connection

In Claude Code, try:

```
> List my GitHub repositories
```

## Project Structure

```
.
├── docs/                    # Tutorial documentation
│   ├── 01-getting-started/  # MCP basics and setup
│   ├── 02-github-mcp/       # GitHub integration (main focus)
│   └── 03-more-servers/     # Sentry, SQLite, Brave Search
├── examples/                # Working configuration examples
│   └── configs/             # JSON configs you can copy
└── exercises/               # Hands-on practice
```

## Learning Path

1. **Start here**: [What is MCP?](docs/01-getting-started/what-is-mcp.md)
2. **Set up**: [Prerequisites](docs/01-getting-started/setup-prerequisites.md)
3. **GitHub**: [Authentication Guide](docs/02-github-mcp/authentication.md)
4. **Practice**: [Exercise 1: Connect to GitHub](exercises/01-connect-github.md)

## MCP Servers Covered

| Server | Use Case | Difficulty |
|--------|----------|------------|
| GitHub | Repos, issues, PRs | Beginner |
| Sentry | Error monitoring | Intermediate |
| SQLite | Database queries | Intermediate |
| Brave Search | Web search | Beginner |

## Resources

- [MCP Documentation](https://modelcontextprotocol.io/)
- [Claude Code Docs](https://docs.anthropic.com/claude-code)
- [GitHub MCP Server](https://github.com/github/github-mcp-server)

## Contributing

Found an issue or want to add content? PRs welcome!

## License

MIT
