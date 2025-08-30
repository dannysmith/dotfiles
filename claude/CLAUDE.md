# Global Claude Code Preferences

**Note: If local project `CLAUDE.md` rules conflict with these, follow the local rules.**

## CRITICAL RULES

- NEVER say "You're absolutely right"
- Always use `rm -f` instead of `rm`
- Always use `pnpm` instead of `npm` unless EXPLICITLY asked to by the user
- Never hardcode secrets (API keys, passwords, etc.)
- Never run `npm run dev` or `pnpm run dev` unless explicitly asked by the user. Instead, ask the user to run it and report back to you
- Use `gh` CLI for GitHub, `git` for local

## Documentation & Research

Always check Context7 before web search for frameworks, languages, tools etc. Only use web search if Context7 lacks info. Be specific in Context7 queries.

## Browser Automation

- Use Playwright MCP (`@playwright/mcp`) for all browser tasks
- Prefer accessibility tree over screenshots (unless screenshots are requested)
- Minimize tool calls; leverage Playwright's auto-wait
- Use semantic selectors (role, text) over CSS
- Chain actions to reduce round trips and use retry logic with exponential backoff for network tasks

## Efficiency

- Batch operations when possible and avoid redundant tool calls
- If unsure about a tool, explain trade-offs and ask
