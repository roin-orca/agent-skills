# Prototyping

How to create test JSON files as prototypes when the user needs sample data or a starting structure.

## When to Prototype

Create a prototype JSON file when the user:

- Wants to see what a JSON structure would look like before committing to it
- Needs sample/mock data for testing or development
- Is designing a schema or config format and wants to iterate on the shape
- Says things like "create a test JSON", "make a sample", "mock this out", "scaffold a JSON file"

## Process

1. **Clarify the purpose** — ask what the JSON will be used for (API response, config file, data fixture, schema design)
2. **Determine the shape** — ask about top-level keys, nesting, and any arrays
3. **Generate realistic data** — use plausible values, not placeholder gibberish
4. **Write the file** — save it to the location the user specifies, or suggest a sensible default path
5. **Invite iteration** — ask if the user wants to adjust keys, add fields, or change the structure

## Naming and Placement

- Default filename: `sample.json` or `test-data.json` in the current directory
- For config prototypes: use the conventional name (e.g., `config.json`, `settings.json`)
- For API mocks: suggest placing in a `mocks/` or `fixtures/` directory
- Always confirm the path before writing

## Realistic Sample Data

Use believable, varied values — not repetitive filler. Mix data to make the prototype useful for testing.

**Bad — repetitive and useless for testing:**
```json
[
  {"name": "test1", "value": "value1"},
  {"name": "test2", "value": "value2"},
  {"name": "test3", "value": "value3"}
]
```

**Good — varied and realistic:**
```json
[
  {"name": "Alice Chen", "email": "alice@example.com", "role": "admin", "active": true},
  {"name": "Bob Martinez", "email": "bob@example.com", "role": "editor", "active": true},
  {"name": "Carol Okafor", "email": "carol@example.com", "role": "viewer", "active": false}
]
```

### Data Guidelines

- **Names:** use diverse, realistic names
- **Emails:** use `@example.com` (reserved domain, safe for testing)
- **Dates:** use recent, realistic ISO 8601 dates
- **IDs:** use sequential integers or realistic UUIDs
- **Booleans:** mix `true` and `false` to test both branches
- **Nulls:** include at least one `null` value if the schema allows optional fields
- **Numbers:** vary the values, include edge cases (zero, negative, decimals) where appropriate
- **Arrays:** vary the length across entries (empty, one item, several items)

## Prototype Sizes

Scale the prototype to the user's needs:

| Purpose | Suggested size |
|---------|---------------|
| Schema exploration | 1-2 objects, all fields shown |
| UI development | 5-10 entries, enough to see lists and pagination |
| Testing edge cases | 3-5 entries targeting specific scenarios (empty, null, long strings, special chars) |
| Load/performance testing | Ask the user for a count, generate accordingly |

Default to **3-5 entries** if the user doesn't specify.

## Include Edge Cases

When generating test data, include at least one entry that tests boundaries:

- An optional field set to `null`
- An empty string `""`
- An empty array `[]`
- A string with special characters (quotes, unicode, newlines)
- A number at zero or negative
- A deeply nested object (if the schema supports it)

These help the user catch bugs early without having to think of edge cases themselves.

## Config File Prototypes

When prototyping config files, add inline comments explaining each field — but only if the target format supports it (JSONC, not strict JSON). For strict JSON, include a companion `config.README.md` or explain each field when presenting the file.

**Example config prototype:**
```json
{
  "server": {
    "host": "localhost",
    "port": 3000
  },
  "database": {
    "url": "postgres://localhost:5432/myapp_dev",
    "pool_size": 5
  },
  "logging": {
    "level": "debug",
    "format": "json"
  },
  "features": {
    "dark_mode": true,
    "beta_access": false
  }
}
```

## After Creating the Prototype

- Show the full file contents so the user can review
- Highlight any design decisions you made (e.g., "I used an array here since you mentioned multiple items")
- Ask: "Want to adjust any fields, add more entries, or change the structure?"
- Offer to generate a matching TypeScript interface, JSON Schema, or equivalent if the user is designing an API
