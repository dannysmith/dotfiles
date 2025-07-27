---
description: Efficiently prime a new Claude Code session with essential project context
allowed-tools: [Read, LS, Glob, Grep, Bash]
---

# /prime-context - Prime Session with Project Context

## Purpose

Quickly establish essential project understanding in a new Claude Code session without overloading the context window.

## Usage

```
/prime-context [focus_area]
```

## Arguments

- `focus_area` - Optional specific area to prioritize (e.g., "api", "frontend", "tests")

## Execution

1. **Read core documentation** (in order of priority)

   - Read CLAUDE.md if it exists (project-specific AI instructions)
   - Read README.md or README (project overview)
   - Read docs/README.md if it exists (detailed documentation)
   - If focus_area specified, look for relevant docs in docs/ directory

2. **Analyze project type and structure**

   - Check for package.json, Cargo.toml, pyproject.toml, go.mod, etc.
   - Identify primary language and framework
   - Run `ls -la` to see top-level structure
   - Note key directories: src/, app/, lib/, test/, docs/

3. **Extract key technical details**
   From configuration files, identify:

   - Project name and version
   - Main dependencies/frameworks
   - Available scripts/commands (build, test, lint, etc.)
   - Entry points (main, index, app)

4. **Quick codebase scan**

   - Use Glob to find main source files by extension
   - Identify architectural patterns from file organization
   - Look for configuration files (.env.example, config/, settings)
   - Check for test structure and coverage

5. **Check recent activity** (if relevant)

   - Run `git log --oneline -10` for recent commits
   - Check for TODO/FIXME comments if focus_area specified:
     ```bash
     grep -r "TODO\|FIXME\|HACK\|XXX" --include="*.{js,ts,py,go,rs}" . | head -20
     ```

6. **Summarize findings**
   Provide a concise summary:

   ```
   Project: [Name] ([Type/Framework])
   Language: [Primary language]

   Key Structure:
   - [Main directories and their purposes]

   Key Commands:
   - Build: [command]
   - Test: [command]
   - Run: [command]

   Focus Area: [If specified, key findings about that area]

   Ready to assist with this [type] project.
   ```

## Optimization Strategies

- **Skip large generated files**: node_modules/, vendor/, dist/, build/
- **Read selectively**: Only read full files if they're critical documentation
- **Use grep efficiently**: Search for patterns rather than reading everything
- **Leverage existing docs**: Trust CLAUDE.md and README over code analysis
- **Stop early**: Once you have enough context to be helpful, stop analyzing

## Other Rules & Information

- This is a generic fallback - prefer project-specific context commands if they exist
- Keep the summary concise - aim for <30 lines
- Don't analyze every file - focus on understanding the project's purpose and structure
- If CLAUDE.md exists, it likely contains the most important project-specific information
- The goal is to be helpful quickly, not to understand every detail
