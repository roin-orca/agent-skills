# scope — One logical change per commit

## Why it matters
Atomic commits make `git bisect`, `revert`, and `cherry-pick` reliable. Mixed commits are harder to review and harder to undo.

## Incorrect

One commit that:
- Fixes a typo in the README
- Adds a new API endpoint
- Reformats whitespace in three files

## Correct

Three separate commits:
```
Fix typo in README
```
```
Add /api/users/:id/preferences endpoint
```
```
Format whitespace in auth module
```

Each commit is independently revertible and reviewable.
