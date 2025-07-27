# Global Docs

This directory contains global documents to assist AI coding tools such as Claude Code, Gemini Code, Cursor etc. This README also serves as human-readable documentation for the AI-related parts of this dotfiles repo.

# Claude Code

## Commands

Most commands should live in individual projects, not globaly in these dotfiles. This allows for them to be customised specifically for the relevant project and tech stack, making them far more useful. However, there are _some_ commands which are useful globally in all projects. **All commands in this repo should be namespaced with `g` for global**

Generally speaking, all commands should be either actual _commands_ which run a sequence of discrete steps and produce an outcome or a simple shortcut for an instruction which you find yourself typing all the time (eg _Check what we've done is in accordance with `/docs/architecture-guidelines.md` and then run `npm run check:all` and fix any errors_). For more in-depth tasks where you need the Agent to take on a specific persona or "become" a specialist, you should probably be using agents instead.

The format for all global claude commands should follow the format in `claude/commands/g/create-claude-command.md`

- [ ] `/g:boilerplate-init` - Adds **minimal** AI set-up to current project, merging with any existing stuff
  - Copies over minimal template for `docs/` and `.claude/` and `.cursor/` and `CLAUDE.md` and `GEMINI.md` from `~/.dotfiles-docs/templates/boilerplate-init`, merging intelligently where anything already exists.
  - Reviews current project documentation and structure (and package.json etc) and determines minimal set of docs and instructions and commands to include in the project.
- [x] `/g:tasks:init` - Initialise simple task management system in project with (`docs/tasks-done` `docs/tasks-todo` simple `docs/TASKS.md` instructions with current task and instructions on usage.)
- [x] `/g:tasks:new` - Create a new task with a suitable title and very basic template.
- [x] `/g:tasks:newgh` - Pull a GH issue and turn it into a task document (incl a link to the original issue)
- [ ] `/g:tasks:renumber` - Renumber numbered tasks in `tasks-todo` so they start from 1.
- [ ] `/g:docs:update` - Update Project documents
- [ ] `/g:generate-commit-message` - Generate an appropriate commit message for recent uncomitted work
  - https://github.com/TuckerTucker/tkr-portfolio/blob/main/.claude/commands/commit.md
  - https://github.com/dannysmith/dannyis-astro/blob/main/.cursor/rules/commit-messages.mdc
  - https://github.com/dannysmith/dannyis-astro/blob/main/docs/conventional-commits.md
- [ ] `/g:prime-context` - Prime Claude session with context efficiently
  - https://github.com/TuckerTucker/tkr-portfolio/blob/main/.claude/commands/context_prime.md
  - [ ] `/g:review` - Runs multi-step review of recent work based on https://github.com/dannysmith/lol/issues/10#issuecomment-3098544641
  - Take a "step" as an argument

## Agents

Agents...

See here for more inspiration: https://github.com/wshobson/agents

- [ ] Designer (take info from here: https://github-spark-docs.simonwillison.net/#system-prompt and maybe https://github.com/iannuttall/claude-agents/blob/main/agents/frontend-designer.md)
- [ ] Task Planner - https://github.com/iannuttall/claude-agents/blob/main/agents/project-task-planner.md
- [ ] Code Refactorer - https://github.com/iannuttall/claude-agents/blob/main/agents/code-refactorer.md
- [ ] Technical Writer -
- [ ] Security Consultant - https://github.com/iannuttall/claude-agents/blob/main/agents/security-auditor.md
- [ ] Write-Like-Danny - see Claude Desktop project and https://github.com/iannuttall/claude-agents/blob/main/agents/content-writer.md

# Gemini Code

# Cursor
