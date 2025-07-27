---
description: Generate a conventional commit message based on staged changes
allowed-tools: [Bash]
---

# /generate-commit - Generate Commit Message

## Purpose

Analyze staged changes and generate a properly formatted conventional commit message without actually committing.

## Usage

```
/generate-commit
```

## Execution

1. **Check git status**
   - Run `git status --porcelain` to see current changes
   - Run `git diff --cached --name-status` to see staged changes
   - If no staged changes, run `git diff --name-status` to see unstaged changes

2. **Analyze changes**
   - Run `git diff --cached` (or `git diff` if nothing staged) to examine actual changes
   - Identify the nature of changes:
     - New features added?
     - Bugs fixed?
     - Documentation updated?
     - Dependencies changed?
     - Code refactored?

3. **Determine commit type**
   Based on changes, select appropriate type:
   - `feat`: New feature or functionality
   - `fix`: Bug fix
   - `docs`: Documentation only changes
   - `style`: Code style changes (formatting, missing semicolons, etc)
   - `refactor`: Code change that neither fixes a bug nor adds a feature
   - `test`: Adding or updating tests
   - `chore`: Changes to build process, dependencies, or tooling
   - `perf`: Performance improvements
   - `revert`: Reverting a previous commit
   
   **Note**: If the change type is unclear or doesn't fit these categories, omit the type prefix entirely. A commit without a type is valid and better than forcing an incorrect type.

4. **Determine scope** (optional)
   - Look at file paths to identify the area of code affected
   - Common scopes: auth, api, ui, config, build, deps
   - Use the most specific relevant scope

5. **Generate commit message**
   Format the message as:
   ```
   <type>[(<scope>)]: <description>
   
   <body>
   
   <footer>
   ```
   
   Rules:
   - Description: imperative mood, present tense, lowercase, no period, max 50 chars
   - Body: Explain what and why, not how. Wrap at 72 characters
   - Footer: Reference issues, breaking changes

6. **Present the message**
   Display the generated message in a format that's easy to copy:
   ```
   ========== GENERATED COMMIT MESSAGE ==========
   [generated message here]
   ==============================================
   
   To use this message:
   git commit -m "[first line]" -m "[body]"
   
   Or for interactive commit:
   git commit
   [then paste the full message]
   ```

## Examples

For adding a new command:
```
feat(commands): add generate-commit command for message generation

Implements a new global command that analyzes git changes and generates
properly formatted conventional commit messages. The command follows the
Conventional Commits 1.0.0 specification.

- Analyzes staged and unstaged changes
- Determines appropriate commit type and scope
- Generates multi-line commit messages with proper formatting
```

For fixing a bug:
```
fix(tasks): correct file renaming logic in renumber command

The renumber command was not preserving file extensions correctly when
using sed pattern matching. Updated regex to properly capture and maintain
the full filename suffix.
```

For general updates without clear type:
```
Update project configuration and dependencies

Modified several configuration files to support new build process.
Updated package versions to resolve security vulnerabilities.
```

## Other Rules & Information

- Always analyze actual code changes, not just filenames
- Keep descriptions concise but meaningful
- Include breaking changes in footer with "BREAKING CHANGE:" prefix
- Reference issues with "Closes #123" or "Fixes #123" in footer
- If changes span multiple types, choose the most significant one
- Never actually run `git commit` - only generate the message