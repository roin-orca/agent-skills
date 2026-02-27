# structure — Use subject + blank line + body format

## Why it matters
A well-structured commit message is easy to scan in `git log --oneline` while still providing detail when needed.

## Incorrect

```
Fixed the login bug where users couldn't sign in because the session token was expired and the refresh logic wasn't being triggered properly due to a race condition in the auth middleware
```

Long single-line message that's hard to scan and wraps poorly.

## Correct

```
Fix session refresh race condition in auth middleware

The refresh token logic was not triggered when concurrent requests
arrived before the initial refresh completed. Added a mutex to
serialize refresh attempts.

Fixes #342
```

Clear subject for scanning, detailed body for context.
