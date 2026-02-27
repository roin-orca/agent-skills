# Questioning — Sharpening the Idea

Good questions are the core of brainstorming. Ask one question per message. Listen to the answer before choosing the next question.

## Question Sequence

Start broad, then narrow:

1. **Problem** — "What problem does this solve?" or "What's the pain point today?"
2. **Users** — "Who will use this? How do they interact with it?"
3. **Success** — "How will you know this works? What does 'done' look like?"
4. **Scope** — "What's explicitly out of scope for the first version?"
5. **Constraints** — "Are there performance, compatibility, or timeline constraints?"
6. **Edge cases** — "What happens when [unusual condition]?"

You don't always need all six. Stop when you can explain the idea back and the user agrees.

## Question Types

**Prefer multiple choice when you can offer informed options:**
> Should we store this in (a) the existing user table, (b) a new preferences table, or (c) local storage?

**Use open-ended when the design space is wide:**
> What should happen when a user loses network connectivity mid-upload?

**Use confirmation to validate your understanding:**
> So the goal is to let admins bulk-invite users via CSV, and they should get feedback on which rows failed — is that right?

## Anti-Patterns

- **Question dumps** — asking 3+ questions in one message. Split them up.
- **Leading questions** — "Should we use React?" when you haven't explored alternatives.
- **Premature detail** — asking about database indexes before understanding the feature.
- **Ignoring answers** — asking a question the user already addressed. Track what you know.
