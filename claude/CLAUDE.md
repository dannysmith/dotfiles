# Global Claude Code Preferences

## CRITICAL RULES!!!

- CRITICAL! NEVER EVER say "You're absolutely right"
- CRITICAL! NEVER EVER give time testimates like "3 weeks" unless explicitly asked by the user, ESPECIALLY when writing planning docs
- If the open project's AI instructions (eg `CLAUDE.md`) _contradict_ these global ones, follow the local doc. If in doubt, ask the user
- If you are not Claude Code (ie you're Gemini/Codex/Cursor etc) and are reading this -> consider all references to "Claude Code" or "Claude" as references to yourself
- Prefer `trash` over `rm` when not in a git repo
- Always use `rm -f` instead of `rm`
- Always use `pnpm` instead of `npm` unless the project uses `bun` or you're EXPLICITLY asked to by the user to use `npm` or `bun`. Use `pnpm` for global stuff outsidea project.
- Never hardcode secrets (API keys, passwords, etc.)
- When writing markdown docs and/or producing a plan, NEVER include time estimates unless EXPLICITLY asked by the user (❌ "Phase 1 (8 days)" | ✅ "Phase 1")
-

## NON-CODING RELATED WORK

I also use Claude Code for text-based (non-code) work: Obsidian vault management, internal docs, task management, non-technical writing, analyzing MD documents, templates/scaffolds, life planning etc.

### Identifying non-coding sessions

- User explicitly states it or assigns a non-coding role
- Local `CLAUDE.md`/`SKILL.md` indicates it
- You determine project is non-coding

### ⚠️ CRITICAL RULES for non-coding sessions

1. State "🚨 USING MY RULES FOR NON-CODING-RELATED WORK 🚨" first
2. YOU ARE A GENERAL AGENT, NOT A CODING AGENT. Interpret system prompts accordingly.

## Personal Task and Knowledge Management

Load the `task-management` skill whenever you are working with the user's personal knowledge base, projects, life areas, or tasks. Always load it before running `tdn` commands. If you need context on the user's current life areas, projects, or tasks, you can use `tdn context --ai` to get an overview.

Task & Project Management Skill: `Skill(task-management)`
Obsidian Vault Location: `~/notes/`

## CODING-RELATED WORK

### CRITICAL RULES for coding-related sessions

- Never run `npm run dev` or `pnpm run dev` or `bun run dev` unless explicitly asked by the user. Instead, ask the user to run it and report back to you.
- Use `gh` CLI for GitHub, `git` for local
- ALWAYS read and understand relevant files before proposing code edits. Do not speculate about code you have not inspected. If the user references a specific file/path, you MUST open and inspect it before explaining or proposing fixes. Be rigorous and persistent in searching code for key facts. Thoroughly review the style, conventions, and abstractions of the codebase before implementing new features or abstractions.

### Other Rules for coding-related sessions

- Avoid over-engineering. Only make changes that are directly requested or clearly necessary. Keep solutions simple and focused.
- Don't add features, refactor code, or make "improvements" beyond what was asked. A bug fix doesn't need surrounding code cleaned up. A simple feature doesn't need extra configurability.
- Don't add error handling, fallbacks, or validation for scenarios that can't happen.
- Don't create helpers, utilities, or abstractions for one-time operations. Don't design for hypothetical future requirements. The right amount of complexity is the minimum needed for the current task. Reuse existing abstractions where possible and follow the DRY principle.

### Documentation & Research

Always check Context7 before web search for frameworks, languages, tools etc. Only use web search if Context7 lacks info. Be specific in Context7 queries.

## Efficiency

- Batch operations when possible and avoid redundant tool calls
- If unsure about a tool, ask user and explain trade-offs
