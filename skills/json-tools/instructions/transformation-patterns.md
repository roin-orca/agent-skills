# Transformation Patterns

Common patterns for restructuring and transforming JSON data.

## Flattening Nested Objects

Convert deeply nested structures into flat key-value pairs using dot-notation keys.

**Before:**
```json
{
  "user": {
    "name": {
      "first": "Alice",
      "last": "Smith"
    },
    "address": {
      "city": "Portland"
    }
  }
}
```

**After:**
```json
{
  "user.name.first": "Alice",
  "user.name.last": "Smith",
  "user.address.city": "Portland"
}
```

Ask the user what separator to use (`.` is default, `_` and `/` are common alternatives).

## Unflattening

The reverse — expand dot-notation keys into nested objects. Confirm the separator with the user before proceeding.

## Renaming Keys

When renaming keys, ask the user for a mapping. Apply it consistently across the entire structure, including inside arrays of objects.

**Mapping:** `firstName` -> `first_name`, `lastName` -> `last_name`

Apply recursively through all nested objects and arrays.

## Restructuring Arrays of Objects

### Group By

Group array elements by a shared key.

**Before:**
```json
[
  {"dept": "eng", "name": "Alice"},
  {"dept": "sales", "name": "Bob"},
  {"dept": "eng", "name": "Carol"}
]
```

**After (grouped by dept):**
```json
{
  "eng": [
    {"dept": "eng", "name": "Alice"},
    {"dept": "eng", "name": "Carol"}
  ],
  "sales": [
    {"dept": "sales", "name": "Bob"}
  ]
}
```

### Pivot

Convert an array of objects into an object keyed by a specific field.

**Before:**
```json
[
  {"id": "a1", "value": 10},
  {"id": "a2", "value": 20}
]
```

**After (pivoted on id):**
```json
{
  "a1": {"id": "a1", "value": 10},
  "a2": {"id": "a2", "value": 20}
}
```

Warn the user if the pivot key has duplicate values.

### Pluck

Extract a single field from each object in an array.

**Before:**
```json
[
  {"id": 1, "name": "Alice", "age": 30},
  {"id": 2, "name": "Bob", "age": 25}
]
```

**After (pluck name):**
```json
["Alice", "Bob"]
```

## Filtering

Remove entries from arrays or keys from objects based on criteria:

- **By value:** keep entries where `status == "active"`
- **By key pattern:** remove all keys starting with `_` or `$`
- **By type:** remove all `null` values, or all empty strings
- **By depth:** keep only top-level keys

Always confirm the filter criteria before applying.

## Sorting

### Sort Object Keys

Alphabetically sort all keys at every level of nesting.

### Sort Arrays

Sort array elements by:
- Primitive value (alphabetical or numeric)
- A specific key in objects (e.g., sort by `name` or `createdAt`)
- Ask for sort direction (ascending is default)

## Merging

When merging two JSON objects:

- **Shallow merge:** second object's keys overwrite the first's at the top level
- **Deep merge:** recursively merge nested objects; arrays can be concatenated or replaced (ask the user)
- Always show conflicts and let the user decide on resolution strategy

## Safety Rules

- Always read the original file before transforming
- Show a preview of changes before writing (for large files, show a representative sample)
- Preserve the original indentation style unless reformatting is explicitly requested
- For destructive transforms (removing keys, filtering), confirm before applying
