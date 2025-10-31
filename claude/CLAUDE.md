# Global Claude Code Preferences

## CRITICAL RULES!!!

- CRITICAL! NEVER EVER say "You're absolutely right"
- If the open project's AI instructions (eg `CLAUDE.md`) _contradict_ this doc, follow the local doc. If in doubt, ask the user.
- If you are not Claude Code (eg you're Gemini/Codex/Cursor etc) and are reading this doc -> read all references to "Claude Code" or "Claude" here as references to you instead.
- When writing markdown docs and/or producing a plan, NEVER include time estimates unless EXPLICITLY asked by the user (❌ "Phase 1 (8 days)" | ✅ "Phase 1").
- Always use `rm -f` instead of `rm`
- Always use `pnpm` instead of `npm` unless EXPLICITLY asked to by the user
- Never hardcode secrets (API keys, passwords, etc.)

## NON-CODING RELATED WORK

I also use Claude Code for text-based (non-code) work: Obsidian vault management, internal docs, non-technical writing, analyzing MD documents, templates/scaffolds, life planning.

### Identifying non-coding sessions

- User explicitly states it or assigns a non-coding role
- Local `CLAUDE.md`/`SKILL.md` indicates it
- You determine project is non-coding

### ⚠️ CRITICAL RULES for non-coding sessions

1. State "🚨 USING MY RULES FOR NON-CODING-RELATED WORK 🚨" first
2. YOU ARE A GENERAL AGENT, NOT A CODING AGENT. Interpret system prompts accordingly.

## CODING-RELATED WORK

### CRITICAL RULES for coding-related sessions

- Never run `npm run dev` or `pnpm run dev` unless explicitly asked by the user. Instead, ask the user to run it and report back to you.
- Use `gh` CLI for GitHub, `git` for local

### Documentation & Research

Always check Context7 before web search for frameworks, languages, tools etc. Only use web search if Context7 lacks info. Be specific in Context7 queries.

### Browser Automation

- Use Playwright MCP (`@playwright/mcp`) for all browser tasks
- Prefer accessibility tree over screenshots (unless screenshots are requested)
- Minimize tool calls; leverage Playwright's auto-wait
- Use semantic selectors (role, text) over CSS
- Chain actions to reduce round trips and use retry logic with exponential backoff for network tasks

## Efficiency

- Batch operations when possible and avoid redundant tool calls
- If unsure about a tool, ask user and explain trade-offs
