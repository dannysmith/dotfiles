---
description: Create a new task from a GitHub issue
allowed-tools: [Bash]
---

# /tasks/newgh - Create Task from GitHub Issue

## Purpose

Create a new unprioritized task from a GitHub issue by fetching its title and content.

## Usage

```
/tasks:newgh [issue-url-or-number]
```

## Arguments

- `issue-url-or-number` - GitHub issue URL (e.g., https://github.com/owner/repo/issues/123) or issue number for current repo

## Execution

1. **Get issue reference**

   - If `$ARGUMENTS` provided: use it as the issue reference
   - If no arguments: ask user "Enter GitHub issue URL or issue number:"

2. **Determine issue type and fetch data**

   - If input matches GitHub URL pattern (https://github.com/owner/repo/issues/123):
     - Use `gh issue view <URL> --json title,body,url` to fetch data
   - If input is just a number:
     - Use `gh issue view <number> --json title,body,url` to fetch data
   - If neither, report error: "Invalid input. Please provide a GitHub issue URL or issue number."

3. **Create task file**

   - Extract issue title, body, and URL from the gh command output
   - Convert title to kebab-case for filename (lowercase, alphanumeric only, max 5 words)
   - Create file: `docs/tasks-todo/task-x-[kebab-title].md`
   - Write content in this exact format:

     ```
     # Task: [Original Issue Title]

     [Issue URL]

     [Issue Body Content]
     ```

4. **Report result**
   - Output: "Created task from issue: [filename]"
   - If any step fails, report the specific error

## Example Commands

- For issue URL: `gh issue view https://github.com/owner/repo/issues/123 --json title,body,url`
- For issue number: `gh issue view 123 --json title,body,url`
- Create directory: `mkdir -p docs/tasks-todo`
- Parse JSON: Use the `-q` flag like `gh issue view 123 --json title -q .title`

## Other Rules & Information

- Supports both full GitHub URLs and issue numbers (for current repo)
- Attempts direct API fetch for URLs before falling back to gh CLI
- Preserves the original issue content without reformatting
- Issue URL is always included below the title for reference
- Requires either curl or gh CLI to be available
