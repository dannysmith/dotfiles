---
description: Initialize minimal AI assistant boilerplate files for Claude, Cursor, and Gemini
allowed-tools: [Read, Write, LS, Bash]
---

# /initaiboilerplate - Initialize AI Assistant Boilerplate

## Purpose

Set up minimal boilerplate files for AI assistants (Claude, Cursor, Gemini) in a non-destructive way, creating only what's missing.

## Usage

```
/initaiboilerplate
```

## Execution

1. **Analyze existing structure**
   - Check for existing files: CLAUDE.md, GEMINI.md, .claude/, .cursor/, docs/
   - Look for project metadata: package.json, Cargo.toml, pyproject.toml, go.mod, README.md
   - Extract project name and type

2. **Create .claude directory structure** (if missing)
   - Create directories: `mkdir -p .claude/commands`
   - Create `.claude/settings.json` if missing with content:
     ```
     {
       "permissions": {
         "read": true,
         "write": true
       }
     }
     ```

3. **Create CLAUDE.md** (only if missing)
   - Extract project name from metadata or directory name
   - Detect primary language from file extensions or config files
   - Create minimal CLAUDE.md:
     ```
     # Project: [Project Name]
     
     See @docs/ for full documentation.
     
     ## Quick Context
     - Language: [detected language]
     - Type: [detected project type]
     ```

4. **Check for comprehensive check command**
   - If package.json exists, look for scripts matching: check, check:all, verify, validate, ci, precommit, lint:all
   - If found, create `.claude/commands/check.md` with this structure:
     - Use "---" for frontmatter
     - Set description and allowed-tools
     - Create execution section that runs the discovered command
     - Keep it simple - just run the command and report results

5. **Create .cursor structure**
   - Create: `mkdir -p .cursor/rules`
   - Create `.cursor/rules/ai-setup.md`:
     ```
     Please read @CLAUDE.md for project context and conventions.
     ```

6. **Create GEMINI.md** (if missing)
   ```
   Read @CLAUDE.md
   ```

7. **Create docs/README.md** (only if docs/ exists but README.md doesn't)
   ```
   # [Project Name] Documentation
   
   Project documentation goes here.
   ```

8. **Report results**
   - List what was created
   - List what was skipped (already existed)
   - Confirm initialization complete

## Other Rules & Information

- This command is non-destructive - it never overwrites existing files
- Only creates directories and files that are missing
- Keeps all generated content minimal and focused
- The generated check command (if any) serves as an example for project-specific commands