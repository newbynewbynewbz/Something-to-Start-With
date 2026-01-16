# SQLite MCP Server

The SQLite MCP Server lets Claude query and interact with SQLite databases directly.

## What You Can Do

- Query data with SELECT statements
- Explore database schema
- Insert, update, delete records
- Analyze data patterns
- Generate reports from data

## Setup

### Basic Configuration

```json
{
  "mcpServers": {
    "sqlite": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-sqlite",
        "/path/to/your/database.db"
      ]
    }
  }
}
```

Replace `/path/to/your/database.db` with your actual database path.

## Creating a Test Database

For learning, create a sample database:

```bash
# Create a data directory
mkdir -p data

# Create database with sample data
sqlite3 data/learning.db << 'EOF'
CREATE TABLE users (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT UNIQUE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE posts (
    id INTEGER PRIMARY KEY,
    user_id INTEGER,
    title TEXT,
    content TEXT,
    published BOOLEAN DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO users (name, email) VALUES
    ('Alice', 'alice@example.com'),
    ('Bob', 'bob@example.com'),
    ('Charlie', 'charlie@example.com');

INSERT INTO posts (user_id, title, content, published) VALUES
    (1, 'Getting Started', 'Welcome to my blog!', 1),
    (1, 'Draft Post', 'Work in progress...', 0),
    (2, 'Hello World', 'My first post!', 1);
EOF
```

## Common Operations

### Explore Schema

```
> What tables are in the database?

> Describe the users table

> Show me the schema for all tables
```

### Query Data

```
> Show all users

> List published posts with author names

> How many posts does each user have?
```

### Complex Queries

```
> Find users who haven't published any posts

> Show posts from the last 7 days

> What's the average number of posts per user?
```

### Data Analysis

```
> Analyze the user signup trends

> Create a summary of content in the database

> Are there any orphaned records?
```

### Modify Data

```
> Add a new user named "David" with email "david@example.com"

> Publish the draft post with ID 2

> Delete all posts older than 30 days
```

## Example Queries Claude Might Run

When you ask Claude about your data, it translates to SQL:

| Your Request | SQL Generated |
|--------------|---------------|
| "Show all users" | `SELECT * FROM users` |
| "Count posts by user" | `SELECT user_id, COUNT(*) FROM posts GROUP BY user_id` |
| "Find unpublished posts" | `SELECT * FROM posts WHERE published = 0` |

## Safety Considerations

### Read-Only Mode

For production databases, consider using read-only access:

```json
{
  "mcpServers": {
    "sqlite-readonly": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-sqlite",
        "--read-only",
        "/path/to/production.db"
      ]
    }
  }
}
```

### Best Practices

1. **Use copies** - Don't point at production databases
2. **Backup first** - Always have backups before write operations
3. **Review queries** - Check what SQL Claude generates
4. **Limit scope** - Use specific database files, not entire systems

## Troubleshooting

### "Database not found"
- Check the path is correct
- Use absolute path if relative doesn't work
- Ensure the file exists: `ls -la ./data/learning.db`

### "Permission denied"
- Check file permissions
- You may need read/write access to the directory

### "No such table"
- Database might be empty
- Run the schema creation commands first
- Check you're pointing to the right database file

## Next Steps

- [Brave Search MCP](brave-search-mcp.md) - Add web search
