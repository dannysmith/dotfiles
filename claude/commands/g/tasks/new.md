---
description: Create a new unprioritized task in the task management system
allowed-tools: [Bash]
---

# /tasks:new - Create New Task

## Purpose

Create a new unprioritized task file in `docs/tasks-todo` with the format `task-x-[name].md`.

## Usage

```
/tasks/new [task description]
```

## Arguments

- `task description` - Optional description of the task. If not provided, will prompt for input.

## Execution

1. **Check if arguments provided**

   - If `$ARGUMENTS` exists: proceed to step 2 with TASK_INPUT="$ARGUMENTS"
   - If no arguments: ask user "What is this task about? (provide a brief description or leave empty)"
   - Store user response as TASK_INPUT for step 2

2. **Create the task file using bash**

```bash
# TASK_INPUT will be set to either $ARGUMENTS or user's response from step 1
TASK_INPUT="<value from step 1>"

# Extract task name for filename (first 5 words max, kebab-case)
TASK_NAME=$(echo "$TASK_INPUT" | \
  tr '[:upper:]' '[:lower:]' | \
  sed 's/[^a-z0-9 ]//g' | \
  awk '{for(i=1;i<=5&&i<=NF;i++) printf "%s-", $i}' | \
  sed 's/-$//' | \
  sed 's/^-//')

# Default to 'untitled' if no valid name extracted
if [ -z "$TASK_NAME" ]; then
  TASK_NAME="untitled"
fi

# Create the file
FILENAME="docs/tasks-todo/task-x-${TASK_NAME}.md"

# Create directory if needed
mkdir -p docs/tasks-todo

# Create file with title and content
if [ -z "$TASK_INPUT" ]; then
  # Empty task - just title
  echo "# Task: Untitled Task" > "$FILENAME"
else
  # Extract natural language title (capitalize first letter of each word)
  NATURAL_TITLE=$(echo "$TASK_INPUT" | \
    sed 's/[.!?].*//; s/\n.*//' | \
    awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)} 1')

  echo "# Task: $NATURAL_TITLE" > "$FILENAME"
  echo "" >> "$FILENAME"
  echo "$TASK_INPUT" >> "$FILENAME"
fi

echo "Created task: $FILENAME"
```

## Other Rules & Information

- Tasks are created with 'x' priority (unprioritized) by default
- The filename uses kebab-case derived from the task description
- Maximum 5 words used for filename to keep it readable
- The full task description is preserved in the file content
- If no input provided at all, creates an empty task file with just the title
