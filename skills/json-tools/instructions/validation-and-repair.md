# Validation and Repair

How to validate JSON and fix common issues in malformed files.

## Validation Process

Before any operation on JSON data, validate it:

1. **Attempt to parse** — try reading the file as JSON
2. **If parsing fails** — identify the error location (line and column)
3. **Diagnose the issue** — match the error against common problems below
4. **Offer to fix** — explain the issue and propose a repair
5. **Re-validate** — after fixing, parse again to confirm

## Common Malformations

### Trailing Commas

The most common issue. JSON does not allow a comma after the last element.

**Broken:**
```json
{
  "name": "Alice",
  "age": 30,
}
```

**Fixed:**
```json
{
  "name": "Alice",
  "age": 30
}
```

### Single Quotes

JSON requires double quotes for strings and keys. Single quotes are invalid.

**Broken:**
```json
{'name': 'Alice'}
```

**Fixed:**
```json
{"name": "Alice"}
```

### Unquoted Keys

All keys in JSON must be double-quoted strings.

**Broken:**
```json
{name: "Alice", age: 30}
```

**Fixed:**
```json
{"name": "Alice", "age": 30}
```

### Comments

JSON does not support comments. Remove `//` line comments and `/* */` block comments.

**Broken:**
```json
{
  // user's name
  "name": "Alice",
  /* age in years */
  "age": 30
}
```

**Fixed:**
```json
{
  "name": "Alice",
  "age": 30
}
```

### Missing Commas

Elements in objects and arrays must be separated by commas.

**Broken:**
```json
{
  "name": "Alice"
  "age": 30
}
```

**Fixed:**
```json
{
  "name": "Alice",
  "age": 30
}
```

### Unclosed Brackets or Braces

Count opening and closing brackets/braces to find mismatches. Work from the inside out.

### Unescaped Characters in Strings

These characters must be escaped inside JSON strings:

| Character | Escape |
|-----------|--------|
| `"` | `\"` |
| `\` | `\\` |
| Newline | `\n` |
| Tab | `\t` |
| Backspace | `\b` |
| Form feed | `\f` |
| Carriage return | `\r` |

### Numeric Issues

- No leading zeros: `007` is invalid, use `7`
- No hex literals: `0xFF` is invalid, use `255`
- No `NaN`, `Infinity`, or `-Infinity` — these are not valid JSON values
- No octal: `0o77` is invalid

### Duplicate Keys

JSON technically allows duplicate keys but behavior is undefined. Flag duplicates and ask the user which value to keep.

## Repair Strategy

When fixing malformed JSON:

1. Fix one issue at a time, starting from the first error
2. Re-parse after each fix — one error can cascade into many
3. Show each fix with a brief explanation
4. If the file has many issues, summarize the total count and list the categories of fixes applied
5. Never silently fix issues — always report what changed
