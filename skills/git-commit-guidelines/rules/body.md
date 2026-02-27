# body — Explain what and why, not how

## Why it matters
The code diff shows *how* something changed. The commit body should capture the *motivation* and *context* that the diff cannot convey.

## Incorrect

```
Refactor auth module

Changed the if-else to a switch statement and moved the helper
function from line 45 to line 12.
```

Describes the mechanical changes that are already visible in the diff.

## Correct

```
Refactor auth module for readability

The nested conditionals made it difficult to add new auth providers.
Restructured to a dispatch pattern so each provider is independent.
```

Explains the reasoning behind the change.
