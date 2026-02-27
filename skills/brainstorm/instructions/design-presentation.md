# Design Presentation — Walking Through the Design

Present the design section by section, getting approval at each step. Never dump the entire design at once.

## Section Order

Scale each section to its complexity. A simple feature might need one sentence per section. A complex one might need a few paragraphs.

### 1. Overview
What are we building and why? One paragraph max. Tie it back to the problem statement from Phase 2.

### 2. Architecture
Where does it live in the system? What components are involved? How do they connect?

For simple features: "New endpoint in the existing API, new React component in the dashboard."

For complex features: describe the data flow between components. Use a short list or diagram if it helps.

### 3. Data Model
What data does this feature create, read, update, or delete? What's the shape?

Skip this section entirely if the feature doesn't touch persistent data.

### 4. User-Facing Behavior
What does the user see and do? Walk through the key interactions step by step.

For UI work, describe the states: empty, loading, populated, error, edge cases.

### 5. Error Handling
What can go wrong? How does the system respond? What does the user see?

Focus on likely failures. Don't enumerate every theoretical edge case — cover the ones that will actually happen.

### 6. Testing Strategy
What gives confidence this works? Be specific about what to test.

Good: "Test that expired tokens return 401 and redirect to login"
Bad: "Add comprehensive test coverage"

## The Checkpoint Pattern

After each section, pause:

> "Does this look right so far? Anything you'd change before I continue?"

If the user pushes back:
1. Acknowledge the concern
2. Revise that section
3. Re-present and confirm
4. Only then continue to the next section

Don't accumulate disagreements — resolve them in place.

## Design Document

Once all sections are approved, write to `docs/plans/YYYY-MM-DD-<topic>-design.md`:

```markdown
# <Feature Name> — Design

## Problem
<What problem this solves, from Phase 2>

## Decision
<Chosen approach from Phase 3, and why>

## Design

### Architecture
<From section 2>

### Data Model
<From section 3, if applicable>

### User-Facing Behavior
<From section 4>

### Error Handling
<From section 5>

### Testing Strategy
<From section 6>

## Out of Scope
<What was explicitly excluded>

## Open Questions
<Anything deferred or unresolved>
```

Commit this file to git before transitioning to the writing-plans skill.
