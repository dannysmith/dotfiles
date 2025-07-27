---
description: Review code quality for work done in the current session
allowed-tools: [Read, Edit, MultiEdit, Grep, Bash, TodoWrite]
---

# /review-session - Session Code Review

## Purpose

Perform a systematic quality review of code written or modified in the current session before final testing and commits.

## Usage

```
/review-session [--quick]
```

## Arguments

- `--quick` - Do a lighter, faster review focusing only on critical issues

## Execution

1. **Identify session changes**

   - Start with `git status --porcelain` to identify uncommitted changes
   - Check recent commits that might be from this session:
     ```bash
     git log --oneline --since="4 hours ago" --name-only
     ```
   - Review conversation history for any files mentioned/edited that might not show in git
   - Combine all sources to create complete list of files to review:
     - Uncommitted changes (from git status)
     - Recently committed files (from git log)
     - Files Claude knows were touched (from conversation context)
   - Read any files from conversation that aren't in git status to check their current state

2. **Quick scan for major issues** (always do this first)

   - Check for obvious problems:
     - Syntax errors or broken imports
     - Commented-out code blocks
     - Debug console.log/print statements
     - TODO/FIXME comments that need addressing
     - Hardcoded secrets or API keys
     - Security issues (SQL injection, XSS vulnerabilities)
   - If `--quick` flag is set, stop here and report findings

3. **Function complexity pass**

   - Review modified functions for:
     - Length (>50 lines is a red flag)
     - Nesting depth (>3 levels needs attention)
     - Mixed responsibilities (doing too many things)
   - Extract helper functions where beneficial
   - Only refactor if it clearly improves readability

4. **Error handling pass**

   - Check for unhandled:
     - Async operations without try/catch or .catch()
     - File/network operations without error handling
     - User input validation
     - Null/undefined checks where needed
     - Resource cleanup (files closed, connections released, memory freed)
   - Add error handling using project's existing patterns
   - Ensure errors are actionable (not just "something went wrong")

5. **Clean-up pass**

   - Remove:
     - Development console.log/debug statements
     - Commented-out old code
     - Redundant comments like "// increment counter" before `i++`
   - Keep:
     - Production-useful logging
     - Comments explaining WHY (not WHAT)

6. **Naming consistency pass**

   - Check new code for:
     - Vague names (data, temp, obj, etc.)
     - Inconsistent naming with rest of project
     - Misleading names
   - Only rename if it significantly improves clarity

7. **Final elegance pass** (if not --quick)

   - Simplify overly complex expressions
   - Remove unnecessary code
   - Apply language idioms consistently
   - But: Don't change working code just for style

8. **Create review summary**
   Use TodoWrite to track any issues found:
   ```
   Session Review Summary:
   - Files reviewed: [list]
   - Critical issues fixed: [count]
   - Improvements made: [list]
   - Remaining concerns: [list if any]
   ```

## Review Principles

- **Respect existing patterns** - Follow project conventions
- **Don't guess** - If context is missing, flag it but don't assume
- **Minimal changes** - Only change what clearly improves the code
- **No style churn** - Don't reformat for personal preference
- **Preserve behavior** - Don't change logic unless fixing a bug

## Other Rules & Information

- This reviews only session changes, not the entire codebase
- Always do the quick scan first to catch critical issues
- Use project's existing error handling and logging patterns
- Documentation updates are handled separately by `/docs:update`
- The goal is quality assurance, not perfection
