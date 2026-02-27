---
name: brainstorming
description: "Use this before any creative work — designing features, building components, adding functionality, or modifying behavior. Turns rough ideas into validated designs through structured collaborative dialogue."
license: MIT
metadata:
  author: roin-orca
  version: "1.0.0"
---

# Brainstorming: From Idea to Design

Turn rough ideas into validated, actionable designs through structured dialogue before any code is written.

## Why This Exists

Most wasted engineering effort comes from building the wrong thing, not building it wrong. This skill ensures you understand *what* to build and *why* before touching implementation.

<HARD-GATE>
Do NOT write code, scaffold projects, or take any implementation action until a design has been presented and the user has explicitly approved it. No exceptions — not even for "simple" projects.
</HARD-GATE>

## Process

### Phase 1 — Discover

Understand the landscape before asking the user anything.

- Read project files, docs, README, recent git history
- Identify existing patterns, conventions, and constraints
- Note what's already built that relates to the idea

See [instructions/discovery.md](instructions/discovery.md) for detailed guidance.

### Phase 2 — Clarify

Ask questions to sharpen the idea. One question per message.

- Start with "what problem does this solve?" — not "what should we build?"
- Prefer multiple-choice questions when reasonable
- Dig into: purpose, constraints, success criteria, edge cases
- Stop when you can explain the idea back clearly

See [instructions/questioning.md](instructions/questioning.md) for question frameworks.

### Phase 3 — Explore Approaches

Propose 2–3 distinct approaches with honest trade-offs.

- Lead with your recommendation and explain why
- Cover: complexity, maintainability, time-to-ship, risk
- Apply YAGNI ruthlessly — strip unnecessary scope from every option
- Let the user pick or combine

See [instructions/approaches.md](instructions/approaches.md) for how to frame options.

### Phase 4 — Present the Design

Walk through the design in sections, getting approval incrementally.

- Scale each section to its actual complexity (a sentence for simple parts, a few paragraphs for nuanced ones)
- Cover: architecture, components, data flow, error handling, testing strategy
- After each section ask: "Does this look right so far?"
- Be ready to revise — going backward is part of the process

See [instructions/design-presentation.md](instructions/design-presentation.md) for structure templates.

### Phase 5 — Document and Transition

- Write the approved design to `docs/plans/YYYY-MM-DD-<topic>-design.md`
- Commit the design document
- Transition to implementation planning (not implementation itself)

## Key Principles

- **One question at a time** — don't overwhelm
- **Problem before solution** — understand the "why" before the "what"
- **YAGNI ruthlessly** — cut scope early and often
- **Incremental validation** — never present a monolithic design; section by section
- **Every project gets a design** — "simple" projects are where unexamined assumptions waste the most time
- **Flexible process** — go back and re-clarify whenever something feels off
