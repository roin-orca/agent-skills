# subject-line — Keep subject under 72 chars, imperative mood, no period

## Why it matters
Short imperative subjects work well with git tooling (`log --oneline`, `rebase -i`, merge commits) and read naturally as instructions.

## Incorrect

```
added new validation to the user registration form.
```

Past tense, lowercase start, trailing period.

## Correct

```
Add validation to user registration form
```

Imperative mood, capitalized, no trailing period, under 72 characters.
