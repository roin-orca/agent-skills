# Design Presentation — Walking Through the Design

Present the design section by section, getting approval at each step. Never dump the entire design at once.

## Section Order

Scale each section to its complexity. A simple feature might need one sentence per section. A complex one might need a few paragraphs.

### 1. Overview
What are we building and why? One paragraph max.

### 2. Architecture
Where does it live in the system? What components are involved? How do they connect?

For simple features, this can be: "New endpoint in the existing API, new React component in the dashboard."

For complex features, include a brief diagram or data flow description.

### 3. Data Model
What data does this feature create, read, update, or delete? What's the shape?

Skip this section if the feature doesn't touch persistent data.

### 4. User-Facing Behavior
What does the user see and do? Walk through the key interactions.

For UI work, describe the states: empty, loading, populated, error.

### 5. Error Handling
What can go wrong? How does the system respond? What does the user see?

Focus on likely failures, not every theoretical edge case.

### 6. Testing Strategy
What gives confidence this works? Unit tests, integration tests, manual verification?

Be specific: "Test that expired tokens return 401" not "add comprehensive tests."

## Checkpoint Pattern

After each section:

> "Does this look right so far? Anything you'd change before I continue?"

If the user pushes back, revise that section before continuing. Don't accumulate disagreements.

## Design Document Template

Once approved, write to `docs/plans/YYYY-MM-DD-<topic>-design.md`:

```markdown
# <Feature Name> — Design

## Problem
<What problem this solves>

## Decision
<Chosen approach and why>

## Design
<Approved sections from above>

## Open Questions
<Anything deferred or unresolved>
```
