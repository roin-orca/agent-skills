# Discovery — Understanding the Project Landscape

Before asking the user a single question, build context on your own. The better you understand what exists, the sharper your questions will be.

## What to Examine

1. **README and docs/** — project purpose, architecture, conventions
2. **Recent commits** (`git log --oneline -20`) — what's actively being worked on
3. **Directory structure** — how the project is organized, where new code would live
4. **Existing patterns** — how similar features were built before (routes, components, tests)
5. **Dependencies** — what libraries/frameworks are already in use
6. **Open issues or TODOs** — related work that's planned or in progress

## What to Look For

- **Constraints you shouldn't violate** — established patterns, naming conventions, architectural boundaries
- **Reusable pieces** — existing utilities, components, or abstractions the new feature can leverage
- **Gaps** — missing tests, docs, or infrastructure that the new work might expose

## Output

After discovery, you should be able to answer:

- What does this project do?
- How is it structured?
- What patterns does it follow?
- Where would the new work fit in?

Don't present discovery findings as a report. Use them to inform the questions you ask in Phase 2.
