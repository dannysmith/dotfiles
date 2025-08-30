# Global Docs

This directory contains global documents to assist AI coding tools such as Claude Code, Gemini Code, Cursor etc. This README also serves as human-readable documentation for the AI-related parts of this dotfiles repo.

# Claude Code

## Commands

Most commands should live in individual projects, not globaly in these dotfiles. This allows for them to be customised specifically for the relevant project and tech stack, making them far more useful. However, there are _some_ commands which are useful globally in all projects. **All commands in this repo should be namespaced with `g` for global**

Generally speaking, all commands should be either actual _commands_ which run a sequence of discrete steps and produce an outcome or a simple shortcut for an instruction which you find yourself typing all the time (eg _Check what we've done is in accordance with `/docs/architecture-guidelines.md` and then run `pnpm run check:all` and fix any errors_). For more in-depth tasks where you need the Agent to take on a specific persona or "become" a specialist, you should probably be using agents instead.

The format for all global claude commands should follow the format in `claude/commands/g/create-claude-command.md`

### Available Global Commands

#### Meta Commands

- `/g:create-claude-command` - Create a new custom slash command with best practices

#### Task Management

- `/g:tasks:init` - Initialize a simple file-based task management system
- `/g:tasks:new` - Create a new unprioritized task in the task management system
- `/g:tasks:newgh` - Create a new task from a GitHub issue
- `/g:tasks:renumber` - Renumber prioritized tasks to start from 1 with no gaps

#### Development

- `/g:initaiboilerplate` - Initialize minimal AI assistant boilerplate files for Claude, Cursor, and Gemini
- `/g:five` - Apply the Five Whys root cause analysis technique to investigate issues
- `/g:step-back` - Step back from current work to gain perspective and avoid getting trapped in local minima
- `/g:generate-commit` - Generate a conventional commit message based on staged changes
- `/g:prime-context` - Efficiently prime a new Claude Code session with essential project context
- `/g:review-session` - Review code quality for work done in the current session

#### Documentation

- `/g:docs:update` - Update documentation based on recent changes in the current session

## Agents

Agents...

Agents are kept [in this repo](https://github.com/dannysmith/agents) repo to avoid the need to symlink them. Clone into into `~/.claude/agents` to use them.
