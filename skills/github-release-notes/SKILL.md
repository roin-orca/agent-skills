---
name: github-release-notes
description: "Use this when creating a GitHub release. Generates structured release notes from commits since the last tag, categorizes changes, and creates the release via gh CLI."
license: MIT
metadata:
  author: roin-orca
  version: "1.0.0"
---

# GitHub Release Notes

Generate structured, categorized release notes from your commit history and publish a GitHub release.

## Prerequisites

- `gh` CLI installed and authenticated
- Repository has at least one prior tag (or use `--first` for initial release)

## Usage

Run the script with a version tag:

```bash
./scripts/release.sh v1.2.0
```

Or for a dry run (preview without creating the release):

```bash
./scripts/release.sh v1.2.0 --dry-run
```

## What It Does

1. Finds the previous tag automatically
2. Collects all commits between the previous tag and HEAD
3. Categorizes commits by conventional commit prefix (`feat:`, `fix:`, `docs:`, etc.)
4. Generates markdown release notes with sections per category
5. Creates a GitHub release with the generated notes

## Commit Categories

| Prefix | Section |
|--------|---------|
| `feat` | New Features |
| `fix` | Bug Fixes |
| `docs` | Documentation |
| `perf` | Performance |
| `refactor` | Refactoring |
| `test` | Tests |
| `chore` | Maintenance |
| other | Other Changes |

## Example Output

```markdown
## What's Changed

### New Features
- Add user avatar upload (abc1234)
- Support dark mode toggle (def5678)

### Bug Fixes
- Fix session expiry redirect loop (aaa1111)

### Documentation
- Update API reference for v1.2 (bbb2222)
```
