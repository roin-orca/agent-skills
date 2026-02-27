# Questioning Techniques

How to ask effective clarifying questions during brainstorming.

## Before You Ask Anything

Explore the project context first. Check:

- Project files and directory structure
- README, docs, and any existing design documents
- Recent commits and open PRs
- Existing patterns, conventions, and dependencies

This grounds your questions in reality instead of guessing. Many questions answer themselves once you've looked at the code.

## The One-Question Rule

Ask exactly one question per message. If a topic needs more exploration, break it into a sequence of focused questions. Resist the urge to batch — batched questions get incomplete answers and overwhelm the user.

**Bad:**
> What's the target audience? And what platforms should we support? Also, do you have any performance requirements?

**Good:**
> Who is the primary user of this feature?

Then after getting the answer:
> What platforms does this need to run on?

## Prefer Multiple Choice

When you can reasonably anticipate the options, present them as choices. This is faster for the user, shows that you've thought about the problem, and surfaces your assumptions for validation.

**Open-ended (avoid when possible):**
> How should the data be stored?

**Multiple choice (preferred):**
> For data storage, which fits best?
> 1. SQLite — simple, file-based, good for single-user
> 2. PostgreSQL — robust, good for multi-user and complex queries
> 3. In-memory with file persistence — fast, good for temporary/session data

Always include why each option exists. If the user's answer isn't listed, they'll tell you.

## Question Sequence

Follow this progression. Each phase builds on the previous one.

### Phase 1: Purpose and Scope
Understand what and why before anything else.

- What problem does this solve?
- Who is it for?
- What does success look like?
- What's the minimal version that would be useful?

### Phase 2: Constraints and Requirements
Understand the boundaries.

- What must it integrate with?
- Are there performance, security, or compliance requirements?
- What's the timeline or urgency?
- Are there existing patterns or conventions to follow?

### Phase 3: Behavior and Edge Cases
Understand how it should work in practice.

- What happens when X goes wrong?
- How should it handle [specific edge case]?
- What should the user see when [boundary condition]?

## When to Stop Asking

Stop asking questions when you can confidently answer:

1. What are we building?
2. Who is it for?
3. What problem does it solve?
4. What are the key constraints?
5. What does the minimal viable version look like?

If you can describe the design back to the user and they'd agree, you have enough information. Don't over-question — move to proposing approaches.

## Recognizing Hidden Assumptions

Watch for these signals that you're making unexamined assumptions:

- You're picturing a specific implementation without the user describing it
- You're thinking "obviously it should..." — that's an assumption, not a requirement
- The user said something vague ("it should be fast", "keep it simple") that you interpreted concretely
- You skipped a question because the answer seemed obvious

When you catch yourself assuming, turn the assumption into a question:
> I'm assuming this needs to work offline — is that right, or is network access always available?
