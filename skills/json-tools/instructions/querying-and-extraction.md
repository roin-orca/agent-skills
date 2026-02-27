# Querying and Extraction

How to navigate, query, and extract data from JSON structures.

## Path Syntax

Use dot-notation paths to reference values within JSON. Support these patterns:

| Pattern | Meaning | Example |
|---------|---------|---------|
| `key` | Top-level key | `name` |
| `a.b.c` | Nested key | `user.address.city` |
| `a[0]` | Array index | `users[0]` |
| `a[-1]` | Last element | `users[-1]` |
| `a[*]` | All elements | `users[*].name` |
| `a[0:3]` | Slice (indices 0-2) | `users[0:3]` |

## Exploration First

For unfamiliar JSON, help the user understand the structure before querying:

1. **Show the shape** — display keys and types at the top level
2. **Show depth** — report maximum nesting depth
3. **Show array sizes** — report the length of any arrays
4. **Show a sample** — for arrays, show the first 1-2 elements

**Example shape summary:**
```
Root: object (5 keys)
  ├── id: number
  ├── name: string
  ├── tags: array (12 items, strings)
  ├── metadata: object (3 keys)
  │   ├── created: string
  │   ├── updated: string
  │   └── version: number
  └── items: array (148 items, objects)
      └── [0]: object (4 keys: id, label, status, priority)
```

This gives the user enough context to form precise queries.

## Common Queries

### Extract a Single Value

Given a path, return the value at that location.

```
Query: user.name
Result: "Alice"
```

### Extract Multiple Values

Accept a list of paths and return all values.

```
Query: [user.name, user.email, user.role]
Result:
  user.name  = "Alice"
  user.email = "alice@example.com"
  user.role  = "admin"
```

### Collect from Arrays

When using `[*]`, collect the value from every element.

```
Query: users[*].email
Result: ["alice@example.com", "bob@example.com", "carol@example.com"]
```

### Filter Arrays

Support simple predicates for filtering:

```
Query: users[?status=="active"].name
Result: ["Alice", "Carol"]
```

Common predicates:
- `==`, `!=` — equality
- `>`, `<`, `>=`, `<=` — comparison (numbers)
- `contains("substring")` — string containment

### Count and Aggregate

Support basic aggregations:

- `count(users)` — number of elements
- `count(users[?status=="active"])` — count with filter
- `unique(users[*].role)` — distinct values
- `min(items[*].price)`, `max(...)`, `sum(...)` — numeric aggregation

## Output Formats

When presenting query results, adapt to context:

- **Single value:** display inline
- **Short list (< 10):** display as a formatted list
- **Long list (10+):** display first 5, last 2, and total count
- **Complex objects:** display as formatted JSON
- **Tabular data:** if querying multiple fields from an array of objects, present as a markdown table

## Handling Missing Paths

When a path doesn't exist:

- Report which segment of the path failed
- Suggest similar keys if a close match exists (typo correction)
- For array indices, report the actual array length
- For `[*]` queries where some elements lack the key, skip missing entries and note how many were skipped
