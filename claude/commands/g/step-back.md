---
description: Step back from current work to gain perspective and avoid getting trapped in local minima
---

# /step-back - Holistic Perspective Check

## Purpose

Step back from the immediate task to gain a broader perspective, ensuring we're solving the right problem and not getting trapped in local minima or tunnel vision.

## Usage

```
/step-back [current-focus] [--scope component|feature|system|architecture]
```

## Arguments

- `current-focus` - The specific task or problem you're currently working on (optional)
- `--scope` - Level of perspective to take (default: system)

## Execution

1. **Pause and Document Current State**

   - State clearly: "I am currently trying to [specific task]"
   - List: "I have been working on this for [time/number of attempts]"
   - Describe: "My current approach involves [specific technical details]"
   - Example: "I am currently trying to optimize a database query that takes 5 seconds. I have been working on this for 2 hours. My current approach involves adding indexes and rewriting the WHERE clause."

2. **Challenge Assumptions**

   - List all constraints explicitly: "I am assuming that..."
   - Question each: "Is this actually required or did I assume it?"
   - Think radically: "If I could change anything about the system, I would..."
   - Example: "I am assuming that: 1) The data must be real-time, 2) We can't change the schema, 3) The query must return all fields. Actually, checking with requirements, only 3 fields need to be real-time."

3. **Zoom Out to System Level**

   - Map the context: "This component is part of [larger system] which serves [purpose]"
   - Trace upstream: "This problem exists because [root cause analysis]"
   - Consider downstream: "If I implement this solution, it will affect..."
   - Example: "This query is part of the dashboard refresh which serves user analytics. This problem exists because we're polling every second for all users. If I implement more indexes, it will slow down writes to this table."

4. **Explore Alternative Perspectives**

   - Think fresh: "If I just arrived at this codebase today, I would probably..."
   - Think simple: "The absolute simplest solution would be to..."
   - Think different: "Instead of optimizing the query, I could..."
   - Example: "If I just arrived today, I'd question why we poll. The simplest solution would be to cache results. Instead of optimizing the query, I could: use materialized views, implement event-driven updates, or reduce polling frequency."

5. **Evaluate Trade-offs**
   Create a comparison table:

   ```
   Current Approach | Alternative 1 | Alternative 2
   ----------------|--------------|--------------
   Time to implement: X | Y | Z
   Solves root cause: Yes/No | Yes/No | Yes/No
   Technical debt: Low/Med/High | ... | ...
   Maintenance burden: ... | ... | ...
   ```

6. **Make a Recommendation**
   Structure as:
   - "RECOMMENDATION: [Continue/Pivot/Escalate/Defer]"
   - "REASONING: [2-3 sentences on why]"
   - "NEXT STEPS: [Specific actions]"
   - Example: "RECOMMENDATION: Pivot to caching solution. REASONING: The query optimization provides marginal gains while caching eliminates 90% of queries entirely. This addresses the root cause of unnecessary polling. NEXT STEPS: 1) Implement Redis cache with 1-minute TTL, 2) Add cache invalidation on data updates, 3) Monitor cache hit rates."

## Other Rules & Information

- When stuck for >30 minutes, always run this command
- Output your analysis in a structured format, not as a narrative
- Be explicit about assumptions - don't leave them implicit
- Consider non-technical solutions (e.g., changing requirements, user education)
- Remember: Sometimes the best code is no code
- If you find yourself adding complexity to handle edge cases, step back
- Classic example: Spending hours optimizing an O(n²) algorithm when the real issue is that n should never be large
