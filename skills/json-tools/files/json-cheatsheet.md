# JSON Cheatsheet

Quick reference for JSON syntax, data types, and common operations.

## Valid JSON Data Types

| Type | Example | Notes |
|------|---------|-------|
| String | `"hello"` | Must use double quotes |
| Number | `42`, `3.14`, `-1`, `2e10` | No leading zeros, no hex/octal |
| Boolean | `true`, `false` | Lowercase only |
| Null | `null` | Lowercase only |
| Object | `{"key": "value"}` | Keys must be double-quoted strings |
| Array | `[1, 2, 3]` | Elements can be mixed types |

## What JSON Does NOT Support

- Comments (`//` or `/* */`)
- Trailing commas
- Single-quoted strings
- Unquoted keys
- `undefined`, `NaN`, `Infinity`
- Hex numbers (`0xFF`)
- Multi-line strings
- Date type (use ISO 8601 strings: `"2025-01-15T10:30:00Z"`)
- Regular expressions
- Functions

## Common File Types Using JSON

| File | Purpose |
|------|---------|
| `package.json` | Node.js project manifest |
| `tsconfig.json` | TypeScript configuration |
| `composer.json` | PHP Composer manifest |
| `.eslintrc.json` | ESLint configuration |
| `appsettings.json` | .NET application settings |
| `launch.json` | VS Code debug configuration |
| `settings.json` | VS Code / editor settings |
| `manifest.json` | Browser extension / PWA manifest |

## JSON with Comments (JSONC)

Some tools support JSONC, which allows:
- `//` single-line comments
- `/* */` block comments
- Trailing commas

Common JSONC files: `tsconfig.json`, `settings.json` (VS Code), `.vscode/*.json`

When working with JSONC files, do NOT strip comments — they are intentional. Only strip comments when converting to strict JSON.

## JSON5

An extended JSON format that also allows:
- Unquoted keys (if valid identifiers)
- Single-quoted strings
- Hex numbers
- Leading/trailing decimal points (`.5`, `5.`)
- `Infinity`, `-Infinity`, `NaN`
- Multi-line strings (escaped newlines)

## Special Characters Escape Table

| Character | Escape | Unicode |
|-----------|--------|---------|
| `"` | `\"` | `\u0022` |
| `\` | `\\` | `\u005C` |
| `/` | `\/` | `\u002F` (optional) |
| Backspace | `\b` | `\u0008` |
| Form feed | `\f` | `\u000C` |
| Newline | `\n` | `\u000A` |
| Carriage return | `\r` | `\u000D` |
| Tab | `\t` | `\u0009` |

## Size and Performance Hints

- JSON files > 1 MB: summarize structure before operating
- JSON files > 10 MB: work on specific paths rather than loading the whole file
- Deeply nested (> 10 levels): flatten before querying when possible
- Arrays > 1000 elements: use sampling and aggregation rather than listing all

## Quick Format Reference

**Minified** (one line, no whitespace):
```json
{"name":"Alice","scores":[95,87,92]}
```

**Pretty (2-space indent):**
```json
{
  "name": "Alice",
  "scores": [
    95,
    87,
    92
  ]
}
```

**Pretty (tab indent):**
```json
{
	"name": "Alice",
	"scores": [
		95,
		87,
		92
	]
}
```
