#!/usr/bin/env bash
# Generate categorized release notes and create a GitHub release.
# Usage: ./release.sh <version-tag> [--dry-run] [--first]
#
# Examples:
#   ./release.sh v1.2.0              # Create release from last tag to HEAD
#   ./release.sh v1.2.0 --dry-run    # Preview without creating
#   ./release.sh v0.1.0 --first      # First release (all commits)

set -euo pipefail

VERSION="${1:-}"
DRY_RUN=false
FIRST_RELEASE=false

for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=true ;;
    --first) FIRST_RELEASE=true ;;
  esac
done

if [ -z "$VERSION" ]; then
  echo "Usage: $0 <version-tag> [--dry-run] [--first]"
  exit 1
fi

# Verify we're in a git repo
if ! git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
  echo "Error: not inside a git repository"
  exit 1
fi

# Verify gh CLI is available
if ! command -v gh > /dev/null 2>&1; then
  echo "Error: gh CLI is not installed"
  exit 1
fi

# Find previous tag
if [ "$FIRST_RELEASE" = true ]; then
  PREV_TAG=""
  RANGE="HEAD"
  echo "First release — including all commits"
else
  PREV_TAG=$(git describe --tags --abbrev=0 2>/dev/null || true)
  if [ -z "$PREV_TAG" ]; then
    echo "Error: no previous tag found. Use --first for the initial release."
    exit 1
  fi
  RANGE="${PREV_TAG}..HEAD"
  echo "Changes since ${PREV_TAG}"
fi

# Collect commits
COMMITS=$(git log "$RANGE" --pretty=format:"%h %s" --no-merges)

if [ -z "$COMMITS" ]; then
  echo "No commits found in range."
  exit 1
fi

COMMIT_COUNT=$(echo "$COMMITS" | wc -l | tr -d ' ')
echo "Found ${COMMIT_COUNT} commits"
echo ""

# Categorize commits
FEATS=""
FIXES=""
DOCS=""
PERFS=""
REFACTORS=""
TESTS=""
CHORES=""
OTHERS=""

while IFS= read -r line; do
  hash=$(echo "$line" | cut -d' ' -f1)
  msg=$(echo "$line" | cut -d' ' -f2-)

  case "$msg" in
    feat:*|feat\(*) FEATS="${FEATS}\n- ${msg#feat:} (${hash})" ;;
    fix:*|fix\(*)   FIXES="${FIXES}\n- ${msg#fix:} (${hash})" ;;
    docs:*|docs\(*) DOCS="${DOCS}\n- ${msg#docs:} (${hash})" ;;
    perf:*|perf\(*) PERFS="${PERFS}\n- ${msg#perf:} (${hash})" ;;
    refactor:*|refactor\(*) REFACTORS="${REFACTORS}\n- ${msg#refactor:} (${hash})" ;;
    test:*|test\(*) TESTS="${TESTS}\n- ${msg#test:} (${hash})" ;;
    chore:*|chore\(*) CHORES="${CHORES}\n- ${msg#chore:} (${hash})" ;;
    *) OTHERS="${OTHERS}\n- ${msg} (${hash})" ;;
  esac
done <<< "$COMMITS"

# Build release notes
NOTES="## What's Changed"
NOTES="${NOTES}\n"

if [ -n "$FEATS" ]; then
  NOTES="${NOTES}\n### New Features${FEATS}\n"
fi
if [ -n "$FIXES" ]; then
  NOTES="${NOTES}\n### Bug Fixes${FIXES}\n"
fi
if [ -n "$DOCS" ]; then
  NOTES="${NOTES}\n### Documentation${DOCS}\n"
fi
if [ -n "$PERFS" ]; then
  NOTES="${NOTES}\n### Performance${PERFS}\n"
fi
if [ -n "$REFACTORS" ]; then
  NOTES="${NOTES}\n### Refactoring${REFACTORS}\n"
fi
if [ -n "$TESTS" ]; then
  NOTES="${NOTES}\n### Tests${TESTS}\n"
fi
if [ -n "$CHORES" ]; then
  NOTES="${NOTES}\n### Maintenance${CHORES}\n"
fi
if [ -n "$OTHERS" ]; then
  NOTES="${NOTES}\n### Other Changes${OTHERS}\n"
fi

if [ -n "$PREV_TAG" ]; then
  REPO_URL=$(gh repo view --json url -q '.url' 2>/dev/null || true)
  if [ -n "$REPO_URL" ]; then
    NOTES="${NOTES}\n**Full changelog**: ${REPO_URL}/compare/${PREV_TAG}...${VERSION}"
  fi
fi

# Render the notes
RENDERED=$(printf '%b' "$NOTES")

if [ "$DRY_RUN" = true ]; then
  echo "=== DRY RUN — Release ${VERSION} ==="
  echo ""
  echo "$RENDERED"
  echo ""
  echo "(No release created. Remove --dry-run to publish.)"
else
  echo "$RENDERED" | gh release create "$VERSION" --title "$VERSION" --notes-file -
  echo ""
  echo "Release ${VERSION} created."
  gh release view "$VERSION" --json url -q '.url'
fi
