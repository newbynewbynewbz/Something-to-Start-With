# What is MCP?

The **Model Context Protocol (MCP)** is an open standard that lets AI assistants like Claude connect to external tools, data sources, and services.

## Why MCP Matters

Without MCP, Claude can only work with what you paste into the conversation. With MCP, Claude can:

- **Read your GitHub repositories** directly
- **Query databases** for real data
- **Search the web** for current information
- **Monitor errors** in production systems
- **Access any API** through custom servers

## How It Works

```
┌─────────────┐     MCP Protocol     ┌─────────────┐
│             │ ◄──────────────────► │             │
│ Claude Code │                      │ MCP Server  │
│  (Client)   │                      │  (GitHub,   │
│             │                      │   Sentry,   │
└─────────────┘                      │   etc.)     │
                                     └─────────────┘
```

1. **MCP Client** (Claude Code) sends requests
2. **MCP Server** (like GitHub) processes them
3. Server returns data Claude can use

## Key Concepts

### MCP Servers
Programs that expose tools and data to Claude. Examples:
- `@modelcontextprotocol/server-github` - GitHub operations
- `@modelcontextprotocol/server-sqlite` - Database queries
- Remote servers like `https://mcp.sentry.dev/mcp`

### Tools
Actions the server can perform:
- `list_repositories` - Get your repos
- `create_issue` - Make a new issue
- `search_code` - Find code across repos

### Resources
Data the server exposes:
- Repository contents
- Issue details
- Search results

## Types of MCP Servers

### Local (stdio)
Runs on your machine as a subprocess:
```json
{
  "command": "npx",
  "args": ["-y", "@modelcontextprotocol/server-github"]
}
```

### Remote (HTTP)
Hosted service you connect to:
```json
{
  "url": "https://mcp.sentry.dev/mcp"
}
```

## What You'll Build

In this project, you'll learn to:

1. Configure MCP servers in `.mcp.json`
2. Authenticate with services like GitHub
3. Use Claude to interact with external systems
4. Combine multiple MCP servers for powerful workflows

## Next Steps

Ready to get started? Head to [Setup Prerequisites](setup-prerequisites.md).
