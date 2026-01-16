# Workflow: Debug Production Error

Investigate and document production errors using Sentry and GitHub.

## When to Use

- Error alerts from Sentry
- Users reporting bugs in production
- Triaging issues for sprint planning
- Post-incident documentation

## Servers Required

- **Sentry** - Error monitoring and stack traces
- **GitHub** - Code repository and issue tracking

## The Flow

```
┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐     ┌─────────────────┐
│  1. Find Error  │ ──► │  2. Analyze     │ ──► │  3. Research    │ ──► │  4. Document    │
│  (Sentry)       │     │  (Stack Trace)  │     │  (Optional)     │     │  (GitHub Issue) │
└─────────────────┘     └─────────────────┘     └─────────────────┘     └─────────────────┘
```

## Prompts

### Step 1: Find the Error

```
Show the most recent unresolved errors from Sentry
```

**Variations:**
- `Show unresolved errors from the last 24 hours`
- `Show errors affecting more than 100 users`
- `Show errors in the [PROJECT] project`
- `Show critical/fatal errors from Sentry`

### Step 2: Analyze the Error

```
Get details for Sentry issue [ISSUE-ID]
```

Or provide a URL directly:
```
Explain this Sentry error: [SENTRY-URL]
```

**What you'll get:**
- Error message and type
- Stack trace with line numbers
- Tags (environment, browser, OS)
- Extra context (user data, request info)

### Step 3: Research the Fix (Optional)

```
Search the web for how to fix "[ERROR MESSAGE]" in [LANGUAGE/FRAMEWORK]
```

**Examples:**
- `Search for how to fix "Cannot read properties of undefined" in JavaScript`
- `Search for "CORS error" solutions in Node.js`

### Step 4: Create GitHub Issue

```
Create a GitHub issue in [OWNER/REPO] documenting this bug with:
- Error message and Sentry link
- Stack trace location
- Root cause analysis
- Proposed fix
- Reproduction steps if known
```

## One-Shot Prompt

Run the entire workflow with a single prompt:

```
Check Sentry for recent unresolved errors, analyze the most critical one,
and create a GitHub issue in [OWNER/REPO] with the bug details and proposed fix.
```

## Example Output

The workflow creates a GitHub issue containing:

| Section | Description |
|---------|-------------|
| Sentry Link | Direct link to the issue for more details |
| Error | The exact error message |
| Location | File and line number from stack trace |
| Root Cause | Why the error is happening |
| Reproduction | How to trigger the error |
| Proposed Fix | Code snippet showing the solution |

## Tips

1. **Link Sentry issues** - Reference `ISSUE-ID` in commits to auto-close
2. **Include context** - Tags like environment, browser help narrow scope
3. **Check frequency** - High event count = higher priority
4. **Look at trends** - "First seen" tells you if it's a regression

## Variations

### Quick Triage
```
List the top 5 unresolved Sentry errors by user impact
```

### Specific Error Investigation
```
Explain Sentry issue PROJECT-123 and suggest a fix
```

### Batch Processing
```
Show all unresolved errors from the last week and create GitHub issues for each
```

### With AI Analysis
```
Use Sentry's Seer to analyze issue [ISSUE-ID] and provide root cause analysis
```

## Sentry Search Queries

Useful filters for finding errors:

| Query | Description |
|-------|-------------|
| `is:unresolved` | Only unresolved issues |
| `is:unresolved level:error` | Unresolved errors (not warnings) |
| `is:unresolved firstSeen:-24h` | New errors from last 24 hours |
| `is:unresolved users:>100` | Errors affecting 100+ users |
| `is:unresolved environment:production` | Production only |

## Commit Message Format

When fixing bugs, reference the Sentry issue:

```
Fix null check in processUserOrder

Fixes TESTYTEST-1
```

Sentry will automatically mark the issue as resolved when merged.
