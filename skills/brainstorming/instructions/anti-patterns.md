# Anti-Patterns

Common mistakes that derail brainstorming sessions. Recognize and avoid these.

## 1. Skipping the Design ("This Is Too Simple")

**What it looks like:** Jumping straight to code because the task seems trivial.

**Why it's harmful:** "Simple" tasks are where unexamined assumptions cause the most wasted work. A todo app has state management decisions. A config change has rollback implications. A "quick script" has error handling choices.

**The fix:** Every task gets a design, even if it's three sentences. The design can be short — but it must exist and be approved.

## 2. Question Flooding

**What it looks like:** Asking 3-5 questions at once to "be thorough."

**Why it's harmful:** Users skim batched questions. They answer the easy ones, skip the hard ones, and give shallow responses to all of them. You end up with less information than if you'd asked one good question.

**The fix:** One question per message. If you need to explore multiple dimensions, prioritize and ask sequentially.

## 3. Premature Solutioning

**What it looks like:** Proposing a specific technology or architecture before understanding the problem.

**Why it's harmful:** You anchor the conversation on an implementation instead of the actual need. The user starts reacting to your solution instead of explaining their problem. You miss better alternatives.

**The fix:** Finish all clarifying questions before proposing any approach. Understand the problem space fully before entering the solution space.

## 4. Fake Alternatives

**What it looks like:** Presenting 3 approaches that are really minor variations of the same idea.

**Why it's harmful:** The user thinks they've explored the design space when they haven't. You give the illusion of choice without real trade-offs. Genuine alternatives get missed.

**The fix:** Each approach should differ in a fundamental way — different architecture, different trade-off priority, different scope. If you can't find distinct alternatives, say so honestly: "There's really one clear approach here, and here's why."

## 5. Design by Decoration

**What it looks like:** Adding sections to the design document because the template has them, not because they're needed.

**Why it's harmful:** Filler dilutes the important decisions. The user loses focus reading paragraphs about testing strategy for a 10-line utility. The design looks thorough but communicates poorly.

**The fix:** Only include sections that contain actual decisions or non-obvious information. If a section would just say "standard approach," skip it.

## 6. Ignoring Existing Patterns

**What it looks like:** Designing a feature without looking at how similar things already work in the codebase.

**Why it's harmful:** You propose an architecture that clashes with existing conventions. The user has to explain their own codebase to you. The final result feels inconsistent.

**The fix:** Always explore the project context first. Look at how similar features are built. Your design should feel like a natural extension of what's already there, not a foreign import.

## 7. Over-Designing for Flexibility

**What it looks like:** Adding plugin systems, configuration layers, or abstraction boundaries "for future extensibility."

**Why it's harmful:** Speculative flexibility adds real complexity now for hypothetical value later. Most "future requirements" never materialize, and when they do, they don't look like what you predicted.

**The fix:** Apply YAGNI. Design for the stated requirements. A concrete solution that works today beats a flexible framework that works in theory.

## 8. Avoiding Opinions

**What it looks like:** Presenting options without a recommendation, or hedging every suggestion with "it depends."

**Why it's harmful:** The user came to you for expertise. Neutral presentations force them to make technical decisions they asked you to help with. You waste collaborative time being artificially balanced.

**The fix:** Always lead with a recommendation and explain your reasoning. If you genuinely think it depends, name the specific factor it depends on and ask about it.

## 9. Rushing Past Disagreement

**What it looks like:** When the user pushes back on part of the design, quickly conceding and moving on without understanding why.

**Why it's harmful:** You might have been right and the user had a misunderstanding. Or the user has context you're missing that should change more than just the contested point. Either way, the design suffers from unresolved tension.

**The fix:** When the user disagrees, ask what concerns them. Understand their perspective before adjusting. Sometimes the fix is small; sometimes it reshapes the entire design. You can't know which until you listen.
