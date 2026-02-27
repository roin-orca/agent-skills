# Approach Evaluation

How to generate, compare, and recommend design approaches.

## Always Propose Multiple Approaches

Never jump to a single solution. Present 2-3 distinct approaches that represent genuinely different trade-offs, not minor variations of the same idea.

**Bad — fake alternatives:**
> 1. Use React with Redux
> 2. Use React with Context API
> 3. Use React with Zustand

These are all "React with state management." The user learns nothing about the design space.

**Good — real alternatives:**
> 1. Server-rendered pages with minimal JS — simple, fast initial load, limited interactivity
> 2. SPA with client-side routing — rich interactivity, more complex, slower initial load
> 3. Hybrid with islands architecture — best of both, but more build complexity

## Structure Each Approach

For each approach, cover:

1. **What it is** — one sentence description
2. **How it works** — brief explanation of the key mechanism
3. **Strengths** — what it's good at (2-3 points)
4. **Weaknesses** — what it's bad at or what it costs (2-3 points)
5. **Best when** — the scenario where this approach wins

## Making a Recommendation

Always lead with your recommended approach. Don't bury it at the end or hide behind false neutrality. The user hired you to have opinions.

Structure your recommendation as:
> I'd recommend **Approach X** because [primary reason]. It fits your situation because [specific connection to their constraints/goals]. The main trade-off is [honest downside], but [why that's acceptable here].

## Evaluation Criteria

Use these lenses to compare approaches. Not all apply to every decision — pick the ones relevant to the situation.

| Criterion | Question |
|-----------|----------|
| Simplicity | Which has fewer moving parts? |
| Fit | Which aligns with existing patterns in the project? |
| Scope | Which delivers the core value with least work? |
| Flexibility | Which is easiest to change later if requirements shift? |
| Risk | Which has the fewest unknowns or failure modes? |
| User impact | Which gives the best experience for the end user? |

## YAGNI as a Decision Tool

When evaluating approaches, apply YAGNI (You Aren't Gonna Need It) aggressively:

- If two approaches are similar but one "supports future scaling," pick the simpler one
- If an approach requires infrastructure "we'll need eventually," don't pick it for that reason
- If you're adding a layer of abstraction "in case we want to swap X later," remove that layer

The right question isn't "might we need this?" — it's "do we need this right now to solve the stated problem?"

## When the User Pushes Back

If the user disagrees with your recommendation:

1. Ask what concerns them about it — don't defend, listen
2. Check if you missed a constraint or priority
3. Re-evaluate with the new information
4. Either adjust your recommendation or explain the trade-off more clearly

Never dig in on a recommendation when the user has context you don't.

## Scope Negotiation

Often the best design insight isn't picking approach A vs B — it's reducing scope so both work.

When approaches seem too complex relative to the problem:
> Could we simplify the requirements? If we drop [feature X], this becomes straightforward with [simpler approach]. We could always add [feature X] later once the core is working.

Always look for the version of the problem that's 30% of the effort for 80% of the value.
