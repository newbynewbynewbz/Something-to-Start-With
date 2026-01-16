# Brave Search MCP Server

The Brave Search MCP Server adds web search capabilities to Claude, enabling real-time information retrieval.

## What You Can Do

- Search the web for current information
- Find documentation and tutorials
- Research topics beyond Claude's training data
- Get up-to-date news and events
- Verify facts with current sources

## Setup

### Step 1: Get a Brave Search API Key

1. Go to [brave.com/search/api](https://brave.com/search/api/)
2. Sign up for an API account
3. Choose a plan (Free tier: 2,000 queries/month)
4. Copy your API key

### Step 2: Set Environment Variable

Add to `~/.zshrc` or `~/.bashrc`:

```bash
export BRAVE_API_KEY="BSAxxxxxxxxxxxxxxxxxx"
```

Reload your shell:
```bash
source ~/.zshrc
```

### Step 3: Configure MCP

Add to your `.mcp.json`:

```json
{
  "mcpServers": {
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

## Common Operations

### General Search

```
> Search for the latest React 19 features

> What's new in Python 3.12?

> Find the current Node.js LTS version
```

### Documentation Lookup

```
> Search for TypeScript generics documentation

> Find the Express.js middleware guide

> Look up PostgreSQL JSON functions
```

### Current Events

```
> What are the latest AI developments this week?

> Search for recent security vulnerabilities in npm packages
```

### Research

```
> Compare React vs Vue in 2024

> Find benchmarks for Bun vs Node.js

> Search for best practices in API design
```

## Example Workflow: Research + Code

Combine Brave Search with GitHub MCP:

```
> Search for how to implement rate limiting in Express.js,
  then show me examples from popular GitHub repos
```

1. Claude searches the web for patterns
2. Claude finds relevant code on GitHub
3. You get comprehensive implementation options

## API Limits

| Plan | Queries/Month | Rate Limit |
|------|---------------|------------|
| Free | 2,000 | 1/second |
| Basic | 10,000 | 10/second |
| Pro | 100,000 | 50/second |

Check your usage at [brave.com/search/api](https://brave.com/search/api/).

## Troubleshooting

### "Invalid API key"
- Check the key is correctly set in your environment
- Verify it starts with "BSA"
- Try regenerating the key

### "Rate limit exceeded"
- Wait a moment between searches
- Upgrade plan if you need more queries
- Check current usage in Brave dashboard

### No results found
- Try different search terms
- Check if the topic is too niche
- Some queries may be filtered

### Search not working
```bash
# Verify your API key is set
echo $BRAVE_API_KEY

# Should output your key (starting with BSA)
```

## Tips for Better Searches

1. **Be specific**: "Express.js rate limiting middleware 2024" vs "rate limiting"
2. **Include context**: "TypeScript for React" vs just "TypeScript"
3. **Use quotes**: Search for exact phrases when needed
4. **Add timeframe**: Include "2024" or "latest" for recent results

## Privacy Note

Brave Search is designed with privacy in mind:
- No user tracking
- No search history stored
- Anonymous queries

## Next Steps

- [Multi-server config example](../../examples/configs/multi-server.json)
- [Exercise: Combined Workflow](../../exercises/04-combined-workflow.md)
