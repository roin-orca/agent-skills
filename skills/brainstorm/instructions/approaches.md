# Approaches — Framing Options with Honest Trade-offs

Always propose 2–3 distinct approaches before settling on a direction. This prevents anchoring on the first idea and gives the user meaningful choices.

## Structure Each Option

For each approach, cover:

- **What it is** — one-sentence summary
- **How it works** — brief description of the mechanism
- **Pros** — concrete benefits (not vague "more flexible")
- **Cons** — honest downsides (not hand-waved "slightly more complex")
- **Best when** — the scenario where this option wins

## Example

> **Option A: Server-side pagination (recommended)**
> Fetch one page at a time from the API. Simple to implement, scales to any dataset size.
> - Pros: Low memory use, fast initial load, works with millions of rows
> - Cons: Each page turn requires a network request
> - Best when: Dataset is large or unbounded
>
> **Option B: Client-side pagination**
> Fetch all data upfront, paginate in the browser.
> - Pros: Instant page turns after initial load, simpler API
> - Cons: Slow initial load for large datasets, high memory use
> - Best when: Dataset is small and bounded (< 500 rows)
>
> **Option C: Hybrid with virtual scrolling**
> Fetch data in chunks, render only visible rows with virtual scrolling.
> - Pros: Smooth UX, handles large datasets, reduces DOM nodes
> - Cons: More implementation effort, requires a virtualization library
> - Best when: UX is a priority and the team has capacity for extra complexity

## Presenting Your Recommendation

Lead with your recommended option and say why:

> I'd recommend Option A because your dataset will grow over time and you mentioned performance matters. Option B would be simpler but won't hold up past a few hundred rows.

Let the user pick, combine, or propose something different. Don't be attached to your recommendation.

## YAGNI Check

Before presenting, review each option and strip out:

- Features that solve hypothetical future problems
- Abstractions that only matter if requirements change
- Configurability that nobody asked for
- "Nice to haves" disguised as requirements

The right design is the simplest one that solves the stated problem.

## When Options Aren't Useful

Sometimes there's only one reasonable approach. In that case, say so:

> There's really one clear way to do this: [approach]. Here's why the alternatives don't make sense: [reasons]. Does this direction work for you?

Don't fabricate artificial alternatives just to hit the "2–3 options" target.
