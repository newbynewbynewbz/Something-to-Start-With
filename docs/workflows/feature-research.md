# Workflow: Feature Research

Research best practices before implementing a new feature.

## When to Use

- Adding a new feature to your frontend project
- Evaluating libraries or approaches
- Need implementation guidance with code examples

## Servers Required

- **GitHub** - Find real implementations and create issues
- **Web Search** - Research best practices (Brave Search or built-in)

## The Flow

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│  1. Research    │ ──► │  2. Find Code   │ ──► │  3. Document    │
│  (Web Search)   │     │  (GitHub)       │     │  (GitHub Issue) │
└─────────────────┘     └─────────────────┘     └─────────────────┘
```

## Prompts

### Step 1: Research Best Practices

```
Search the web for "best practices for [FEATURE] in [FRAMEWORK] [YEAR]"
```

**Examples:**
- `best practices for dark mode in React 2025`
- `best practices for infinite scroll in Next.js 2025`
- `best practices for form validation in Vue 2025`

### Step 2: Find Real Implementations

```
Search GitHub for popular repos implementing [FEATURE] in [FRAMEWORK]
```

**Examples:**
- `Search GitHub for repos implementing dark mode in React`
- `Search GitHub for infinite scroll libraries JavaScript`

### Step 3: Create Implementation Issue

```
Create a GitHub issue in [OWNER/REPO] summarizing the research with:
- Best practices found
- Recommended libraries
- Implementation steps as a checklist
- Links to resources
```

## One-Shot Prompt

You can run this entire workflow with a single prompt:

```
Research best practices for implementing [FEATURE] in my React project,
find popular GitHub repos doing this, and create an issue in [OWNER/REPO]
with an implementation plan.
```

## Example Output

The workflow creates a GitHub issue containing:

| Section | Description |
|---------|-------------|
| Summary | One-line description of the feature |
| Best Practices | Key principles from web research |
| Libraries | Recommended packages with install commands |
| Code Examples | Starter code snippets |
| Implementation Steps | Checkbox list of tasks |
| Resources | Links to articles and docs |

## Tips

1. **Be specific with the year** - Include current year to get recent results
2. **Specify your framework** - React vs Next.js vs Vue matters for implementation
3. **Ask for trade-offs** - "What are the pros and cons of each approach?"
4. **Request alternatives** - "Show me both library and custom implementations"

## Variations

### Quick Research (No Issue)
```
Research best practices for [FEATURE] and summarize the top 3 approaches
```

### Library Comparison
```
Compare the top 3 libraries for [FEATURE] in React - show stars, bundle size, and API
```

### With Sentry Context
```
We're seeing [ERROR] in Sentry. Research how to properly implement [FEATURE]
to avoid this issue, then create a fix issue in GitHub.
```
