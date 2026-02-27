# Diffing Strategies

How to compare JSON objects and files effectively.

## Preparation

Before comparing, normalize both inputs:

1. **Parse both** — ensure both are valid JSON (fix if needed and the user agrees)
2. **Sort keys** — recursively sort all object keys alphabetically
3. **Normalize numbers** — `1.0` and `1` should be treated as equal unless the user cares about type
4. **Normalize whitespace** — formatting differences are not meaningful

## Diff Categories

Report differences in these categories:

### Added Keys
Keys present in the second file but not in the first.

```
+ user.middleName: "Jay"
+ user.preferences.theme: "dark"
```

### Removed Keys
Keys present in the first file but not in the second.

```
- user.nickname: "Ali"
- user.legacy_id: 12345
```

### Changed Values
Keys present in both but with different values.

```
~ user.name: "Alice" → "Alice Smith"
~ user.age: 30 → 31
```

### Type Changes
Same key but the value type changed.

```
! user.tags: string → array
! config.debug: string "true" → boolean true
```

## Presentation Format

### Small Diffs (< 20 differences)

Show every difference with full paths:

```
Comparing file_a.json ↔ file_b.json

Added (2):
  + settings.newFeature: true
  + settings.newFeatureConfig: {"enabled": true}

Removed (1):
  - settings.deprecated: "old_value"

Changed (3):
  ~ version: "1.0.0" → "1.1.0"
  ~ user.name: "Alice" → "Alice Smith"
  ~ counts.total: 100 → 142

Type changes (1):
  ! config.debug: string → boolean
```

### Large Diffs (20+ differences)

Summarize first, then offer details:

```
Comparing file_a.json ↔ file_b.json

Summary:
  12 keys added
   3 keys removed
  47 values changed
   2 type changes

Top-level keys affected: config, user, metadata

Would you like to see details for a specific section?
```

## Array Diffing

Arrays are harder to diff because elements don't have stable keys. Use these strategies:

### By Index
Compare element-by-element at the same index. Simple but misleading if elements were reordered.

### By Identity Key
If array elements are objects with an `id` or similar unique field, match by that key. This handles reordering correctly.

Ask the user: "These arrays contain objects. Should I match them by index or by a key field (like `id`)?"

### Set Comparison
For arrays of primitives, treat them as sets and report:
- Elements added (in second but not first)
- Elements removed (in first but not second)
- Elements in common

## Nested Diffs

For deeply nested structures, always show the full path to each difference. Group differences by their top-level parent for readability.

## Semantic vs. Structural Diff

- **Structural diff** (default): reports all key/value differences
- **Semantic diff**: ignores certain fields like timestamps, auto-generated IDs, or version numbers

If the JSON looks like it contains auto-generated fields (e.g., `createdAt`, `updatedAt`, `_id`), ask the user if they want to exclude these from the comparison.
