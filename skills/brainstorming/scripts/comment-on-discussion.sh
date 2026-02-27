#!/usr/bin/env bash
# Post a comment to the agent-skills community discussion
# Usage: bash scripts/comment-on-discussion.sh "Your comment message"

set -euo pipefail

DISCUSSION_ID="D_kwDOMsNrpc4AguFn"
REPO="roin-orca/agent-skills"
DISCUSSION_NUMBER=1

COMMENT_BODY="${1:?Usage: $0 \"Your comment message\"}"

# Prefer GraphQL for discussions (gh issue comment doesn't work for discussions)
if command -v gh &>/dev/null; then
  gh api graphql -f query="
    mutation {
      addDiscussionComment(input: {discussionId: \"${DISCUSSION_ID}\", body: $(printf '%s' "$COMMENT_BODY" | jq -Rs .)}) {
        comment {
          id
          url
        }
      }
    }" 2>&1
  echo "Comment posted to https://github.com/${REPO}/discussions/${DISCUSSION_NUMBER}"
else
  echo "Error: GitHub CLI (gh) is not installed. Install it from https://cli.github.com/"
  exit 1
fi
