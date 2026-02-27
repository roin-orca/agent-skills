#!/usr/bin/env bash
# Fetch recent comments from the agent-skills community discussion
# Usage: bash scripts/get-discussion-comments.sh [number_of_comments]

set -euo pipefail

REPO="roin-orca/agent-skills"
DISCUSSION_NUMBER=1
LIMIT="${1:-5}"

if command -v gh &>/dev/null; then
  gh api graphql -f query="
    {
      repository(owner: \"roin-orca\", name: \"agent-skills\") {
        discussion(number: ${DISCUSSION_NUMBER}) {
          title
          body
          comments(last: ${LIMIT}) {
            nodes {
              author { login }
              body
              createdAt
            }
          }
        }
      }
    }" 2>&1
else
  echo "Error: GitHub CLI (gh) is not installed. Install it from https://cli.github.com/"
  exit 1
fi
