# Design Presentation

How to structure and present designs for user approval.

## Scale to Complexity

Not every design needs the same depth. Match the presentation to the problem:

| Project complexity | Design depth |
|---|---|
| Config change, small fix | 3-5 sentences covering what changes and why |
| Single feature or component | A few focused paragraphs with key decisions called out |
| Multi-component system | Full sectioned design with architecture, data flow, and error handling |

If you're writing 500 words about a 20-line change, you've over-designed.

## Present in Sections

Break the design into logical sections and present them one at a time. After each section, ask:
> Does this look right so far?

This catches misunderstandings early instead of presenting a complete design that's wrong in the foundations.

## Design Sections

Use these sections as a menu — include only what's relevant to the problem. Every project needs the first two. The rest depend on complexity.

### 1. Summary (always include)
What we're building and why, in 2-3 sentences. This should be concrete enough that someone reading just this paragraph knows exactly what the feature does.

### 2. Core Behavior (always include)
How the feature works from the user's perspective. What they do, what happens, what they see. No implementation details — just behavior.

### 3. Architecture
How the system is structured. Components, their responsibilities, and how they communicate. Use a simple diagram if it helps:

```
User Input ──► Validator ──► Processor ──► Storage
                  │                          │
                  ▼                          ▼
              Error Response           Confirmation
```

### 4. Data Model
What data exists, how it's structured, and where it lives. Include key fields and relationships but skip obvious ones (like `id`, `created_at`).

### 5. Key Interactions
Walk through the 2-3 most important user flows step by step. Focus on the interesting paths — the ones where decisions were made.

### 6. Error Handling
What can go wrong and how the system responds. Only cover errors that need design decisions — not every possible exception.

### 7. Testing Strategy
How we'll verify this works. What types of tests, what the key test cases are. Keep it to the important scenarios.

## Writing Style

- **Be concrete, not abstract.** "The button sends a POST to /api/submit" beats "the UI component communicates with the backend service."
- **Name things.** Give components, endpoints, and data structures real names, not placeholders.
- **Show, don't describe.** A 3-line code snippet or ASCII diagram is worth a paragraph of explanation.
- **State trade-offs.** If you made a choice, briefly note what you traded away and why.

## The Design Document

After the user approves the full design, write it to a file:

**Path:** `docs/plans/YYYY-MM-DD-<topic>-design.md`

The document should capture:
1. The approved design (what was agreed on)
2. Key decisions and their rationale (why these choices)
3. Scope boundaries (what's explicitly not included)
4. Open questions (if any remain for implementation)

Commit the design document to git before transitioning to implementation planning.

## Transitioning Out

Once the design is approved and documented:
1. Confirm with the user that the design is complete
2. Invoke the writing-plans skill to create an implementation plan
3. Do NOT invoke any other skill — writing-plans is the only valid next step
