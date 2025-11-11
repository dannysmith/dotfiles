---
description: Update documentation based on recent changes in the current session
allowed-tools: [Read, Edit, MultiEdit, Grep, Glob, Bash]
---

# /docs/update - Update Project Documentation

## Purpose

Review recent work in the current session and update relevant documentation in the `docs/` directory to reflect changes made.

## Usage

```
/docs:update
```

## Execution

1. **Gather context about recent changes**

   - Review the conversation history to understand what work has been done
   - Run `git log --oneline -20` to see recent commits
   - Run `git diff --name-only HEAD~5..HEAD` to see recently changed files
   - Note: Focus on changes discussed in the current session

2. **Identify documentation to check**

   - Use Glob to list all files in `docs/` directory
   - **IMPORTANT**: Exclude `docs/tasks-todo/` and `docs/tasks-done/` directories
   - Common files to check:
     - `docs/README.md`
     - `docs/architecture-guide.md`
     - Any other `.md` files in docs/ and its subfolders

3. **Review each documentation file**

   - Read the file to understand current content
   - Check if recent changes affect this documentation:
     - New features added?
     - APIs changed?
     - Configuration updated?
     - Dependencies modified?
     - Setup process changed?

4. **Update documentation as needed**

   - Make updates that reflect the work done in this session
   - Follow any documentation style found in the existing files
   - Keep updates concise and factual
   - Preserve existing formatting and structure

5. **Follow project-specific guidance**

   - Check CLAUDE.md for any documentation guidelines
   - Respect existing documentation patterns
   - Maintain consistency with project conventions

6. **Report updates made**
   - List which files were updated and why
   - List which files were checked but didn't need updates
   - Confirm documentation review complete

## Other Rules & Information

- Never modify anything in `docs/tasks-todo/` or `docs/tasks-done/`
- Only update based on actual changes made, not speculative features
- Preserve the existing tone and style of documentation
- If unsure whether something needs updating, err on the side of leaving it unchanged
- Focus primarily on changes discussed in the current Claude session
