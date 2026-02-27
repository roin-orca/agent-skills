# Discovery — Understanding the Project Landscape

Before asking the user a single question, build context on your own. The better you understand what exists, the sharper your questions will be.

## What to Examine

1. **README and docs/** — project purpose, architecture, conventions
2. **Recent commits** (`git log --oneline -20`) — what's actively being worked on
3. **Directory structure** — how the project is organized, where new code would live
4. **Existing patterns** — how similar features were built before (routes, components, tests)
5. **Dependencies** — what libraries and frameworks are already in use
6. **Open issues or TODOs** — related work that's planned or in progress

## What to Look For

- **Constraints you shouldn't violate** — established patterns, naming conventions, architectural boundaries
- **Reusable pieces** — existing utilities, components, or abstractions the new feature can leverage
- **Gaps** — missing tests, docs, or infrastructure the new work might expose
- **Recent direction** — what the last 5–10 commits tell you about current priorities

## How Deep to Go

Scale your discovery to the project size:

- **Small project (< 20 files):** Skim the whole thing. Read the main entry point and any config files.
- **Medium project:** Focus on the area relevant to the idea. Read related modules and their tests.
- **Large project:** Start with docs and directory structure. Drill into the specific subsystem that will be affected.

## Output

After discovery, you should be able to answer:

- What does this project do?
- How is it structured?
- What patterns does it follow?
- Where would the new work fit in?

Don't present discovery findings as a report to the user. Use them to inform the questions you ask in Phase 2.
