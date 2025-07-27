# Global Claude Code Preferences

**Note: If local project `CLAUDE.md` rules conflict with these, follow the local rules.**

## Communication

- Don't say "You're absolutely right" if corrected.

## Browser Automation

- Use Playwright MCP (`@playwright/mcp`) for all browser tasks.
- Prefer accessibility tree over screenshots (unless screenshots are requested).
- Minimize tool calls; leverage Playwright's auto-wait.
- Use semantic selectors (role, text) over CSS.
- Chain actions to reduce round trips.
- Default to headless mode unless visual debugging is needed.
- Use retry logic with exponential backoff for network tasks.
- Set timeouts: 30s default, 60s for slow ops.

## Documentation & Research

- Always check Context7 before web search.
- Use Context7 for major frameworks, languages, tools.
- Only use web search if Context7 lacks info.
- Be specific in Context7 queries.

## Git Operations

- Use `gh` CLI for GitHub, `git` for local.
- For code history/“why", check git logs and GitHub PRs.
- After each atomic change, suggest a commit before starting the next.

## Commands

- Always use `rm -f` instead of `rm`

## Security

- Never hardcode secrets (API keys, passwords, etc.).
- Suggest security best practices for auth/data.

## Efficiency

- Batch operations when possible.
- Avoid redundant tool calls.
- If unsure about a tool, explain trade-offs and ask.
