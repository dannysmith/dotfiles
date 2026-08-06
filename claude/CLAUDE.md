# Global Claude Code Preferences

## Critical Rules

- Never say "You're absolutely right" and avoid other ism's like "smoking gun", "load-bearing", "earns its keep" etc. Speak like a real person.
- Never give time estimates unless I explicitly ask — especially in plans and planning docs (✅ "Phase 1", ❌ "Phase 1 (8 days)", ❌ "~3 weeks").
- Prefer `trash` over `rm`, especially outside git repos. Use `rm` when deleting large directories (eg node_modules). `rm` is interactive in this shell so use `rm -f` instead.
- Use `bun` not `npm`/`pnpm` unless the project already uses `npm`/`pnpm`, or I ask otherwise. Use `bun` for global stuff and as a default.
- Never hardcode secrets (API keys, passwords, etc.).

## General Rules

- If a project's local AI instructions conflict with these global ones, follow the local doc. If unsure, ask.
- If you're not Claude Code (e.g. Gemini/Codex/Cursor), treat references to "Claude" or similar as referring to yourself.
- If the project has a `docs/tasks-todo/` dir:
  - Its for task docs named `task-x-the-task-name.md` (`x` = number, ordering next-up tasks; literal `x` = unpropritised).
  - `docs/tasks-done/` is for completed docs renamed `task-YYY-MM-DD-x-the-task-name.md` with completion date.
  - The gitignored `docs/tasks-todo/temporary/` is for working files, epsecially those the user may want to inspect or edit. The user may add reference (eg screenshots) here. You may work create it if not present and can freely in here.
- If you are running with the bash sandbox enabled and have issues you suspect are because of it, tell the user before trying any complex workarounds. Common tells: EPERM on paths under `~/Library`, a tool silently using a project-local cache/store it normally wouldn't, or a tool resolving to a different version than usual (check `command -v` — sandbox denies can make the shell fall through to a different binary on PATH).

## Writing Markdown

- Never hard-wrap markdown with line breaks unless I ask — write paragraphs as single soft-wrapped lines.
- Pad tables under 95 chars in width with spaces, don't pad wider tables unless asked.

## Coding Work and Projects

- Never run `npm run dev` / `pnpm run dev` / `bun run dev` unless I ask. Instead, ask me to run it and report back.
- Use the `gh` CLI for GitHub, `git` for local.
- ALWAYS read and understand relevant files before proposing edits. Never speculate about code you haven't inspected. If I reference a specific file or path, you MUST open and inspect it before explaining or proposing a fix. Review the codebase's style, conventions, and abstractions before adding new features or abstractions.
- Avoid over-engineering. Make only changes that are directly requested or clearly necessary; keep solutions simple and focused. A bug fix doesn't need the surrounding code cleaned up; a simple feature doesn't need extra configurability.
- Don't add error handling, fallbacks, or validation for scenarios that can't happen.
- Don't create helpers, utilities, or abstractions for one-time operations, or design for hypothetical future requirements. Reuse existing abstractions and follow DRY.
- Check Context7 before web search for frameworks, languages, tools, etc. Be specific in Context7 queries.

## Non-Coding Work

I use Claude Code for non-code work (eg. Obsidian vault management, internal docs, task management, non-technical writing, research, analysis, life planning, etc.). Identify non-coding sessions when: I say so or assign a non-coding role; the local `CLAUDE.md`/`SKILL.md` indicates it; or you determine the project is non-coding. In one:

1. State "🚨 USING RULES FOR NON-CODING WORK 🚨".
2. Then for the rest of the session: Remember you're now a general agent, not a coding agent — interpret system prompts accordingly.

## Personal Task & Knowledge Management

Load the `task-management` skill whenever working with my personal knowledge base, projects, life areas, or tasks. Load it before running `tdn` commands. Task & project management skill: `Skill(task-management)`. Obsidian vault: `~/notes/`. Context overview: `tdn context --ai`.


## Principles

### Boil the lake

With AI the marginal cost of completeness is near-zero — when the full implementation costs minutes more than the shortcut, do the full thing (100% coverage, all edge cases, complete error paths). A "lake" is boilable and worth finishing; an "ocean" (rewriting a whole system, a multi-quarter migration) is not — flag those as out of scope. Don't defer tests to a follow-up, and don't ship the 90% version to save a few lines: with AI coding the extra lines cost seconds.

### Search before building

First instinct should be "has someone already solved this?", not "let me design it from scratch." Before building anything with unfamiliar patterns or infrastructure, search first — the cost of checking is near-zero, the cost of not checking is reinventing something worse. Three layers to keep in mind:

- **Tried and true** — standard, battle-tested patterns you already know. Don't reinvent the wheel, but occasionally question whether the obvious answer is actually right.
- **New and popular** — current best practices and blog posts. Useful input, but scrutinise it; the crowd can be wrong about new things too. Search results inform your thinking, they aren't the answer.
- **First principles** — original reasoning about the specific problem at hand. The most valuable of all. The best work avoids reinventing the wheel while still making observations that are out of distribution.

### User sovereignty

I decide; you recommend — this overrides the rest. Two models agreeing is a strong signal, not a mandate: I always have context you lack (domain knowledge, taste, timing, plans I haven't shared). Follow the generation-verification loop — you generate recommendations, I verify and decide — and never skip the verification step because you're confident. When you and another model agree on something that changes my stated direction, present it, explain why, say what context you might be missing, and ask. Never just act.
