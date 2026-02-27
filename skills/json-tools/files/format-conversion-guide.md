# Format Conversion Guide

Reference for converting JSON to and from other common data formats.

## JSON to CSV

### Flat Objects

Straightforward — keys become column headers, values become cells.

**JSON:**
```json
[
  {"name": "Alice", "age": 30, "city": "Portland"},
  {"name": "Bob", "age": 25, "city": "Seattle"}
]
```

**CSV:**
```csv
name,age,city
Alice,30,Portland
Bob,25,Seattle
```

### Handling Nested Objects

Flatten nested keys using dot-notation before converting.

**JSON:**
```json
[{"user": {"name": "Alice"}, "role": "admin"}]
```

**CSV:**
```csv
user.name,role
Alice,admin
```

### Handling Arrays Inside Objects

Options (ask the user):
1. **Join with delimiter:** `["a","b","c"]` → `"a;b;c"`
2. **JSON string:** keep as `"[""a"",""b"",""c""]"`
3. **Expand to columns:** `tags[0]`, `tags[1]`, `tags[2]`

### Inconsistent Keys

When objects in the array have different keys:
- Union of all keys as headers
- Empty cells for missing values
- Report which keys are sparse

## CSV to JSON

### Default: Array of Objects

Each row becomes an object, header row provides keys.

**CSV:**
```csv
name,age
Alice,30
Bob,25
```

**JSON:**
```json
[
  {"name": "Alice", "age": "30"},
  {"name": "Bob", "age": "25"}
]
```

### Type Inference

CSV values are strings by default. Offer to infer types:
- `"30"` → `30` (number)
- `"true"` / `"false"` → `true` / `false` (boolean)
- `""` → `null` (empty)
- `"2025-01-15"` → keep as string (dates stay as strings)

Always confirm type inference with the user before applying.

## JSON to YAML

Direct structural mapping:

**JSON:**
```json
{
  "server": {
    "host": "localhost",
    "port": 8080,
    "features": ["auth", "logging"]
  }
}
```

**YAML:**
```yaml
server:
  host: localhost
  port: 8080
  features:
    - auth
    - logging
```

### Watch For
- YAML has special values: `yes`/`no` can be interpreted as booleans — quote them if they're meant as strings
- Multi-line strings: use `|` (literal) or `>` (folded) block scalars
- `null` in JSON maps to `~` or empty value in YAML

## YAML to JSON

Reverse of the above. Key concerns:
- YAML anchors and aliases (`&` / `*`) must be resolved (expanded) in JSON
- YAML merge keys (`<<`) must be expanded
- YAML tags (e.g., `!!str`) should be handled or stripped
- Comments are lost (JSON doesn't support them)

## JSON to TOML

**JSON:**
```json
{
  "database": {
    "host": "localhost",
    "ports": [5432, 5433],
    "enabled": true
  }
}
```

**TOML:**
```toml
[database]
host = "localhost"
ports = [5432, 5433]
enabled = true
```

### Limitations
- TOML doesn't support `null` — ask user for replacement (`""`, `0`, or omit the key)
- TOML requires homogeneous arrays — mixed-type arrays must be resolved
- Deeply nested objects can get verbose in TOML

## General Conversion Rules

1. **Always read both source and target formats** before converting
2. **Preview the output** before writing the file
3. **Preserve data fidelity** — warn if the target format can't represent something from the source
4. **Ask about edge cases** — don't assume how nulls, mixed arrays, or nested data should be handled
5. **Maintain key order** where possible (some formats like TOML have section ordering)
