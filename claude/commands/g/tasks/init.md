---
description: Initialize a simple file-based task management system
allowed-tools: [Bash]
---

# /tasks/init - Initialize Task Management System

## Purpose

Set up a simple file-based task management system with todo and done folders.

## Usage

```
/tasks/init
```

## Execution

1. Execute the following combined bash command to initialize the system:

```bash
# Create directories and files in one command
mkdir -p docs/tasks-done docs/tasks-todo && \
cat > docs/tasks.md << 'EOF'
# Task Management

- Completed tasks are in `tasks-done/`
- Uncompleted tasks are in `tasks-todo/`
  - Tasks are named `task-[number]-[name].md` where number is the order in which tasks should be completed. The lowest number is the current task.
  - If [number] is an `x` it has not been prioritised yet and should not be worked on.
EOF

# Create example task
echo "# Task: Example Task Doc" > docs/tasks-todo/task-1-example.md

# Update CLAUDE.md if it exists
if [ -f "CLAUDE.md" ]; then
  # Check if reference already exists
  if ! grep -q "@docs/tasks.md" CLAUDE.md; then
    # Create temp file with new content at top
    echo "See @docs/tasks.md for task management" > CLAUDE.md.tmp
    echo "" >> CLAUDE.md.tmp
    cat CLAUDE.md >> CLAUDE.md.tmp
    mv CLAUDE.md.tmp CLAUDE.md
    echo "Updated CLAUDE.md with task reference"
  else
    echo "CLAUDE.md already contains task reference"
  fi
else
  echo "No CLAUDE.md found - skipping update"
fi

echo "Task management system initialized successfully!"
```

2. Report the results to the user

## Other Rules & Information

- This command uses mkdir -p to avoid errors if directories already exist
- The CLAUDE.md update only happens if the file exists and doesn't already contain the reference
- All operations are combined into a single bash execution for efficiency
- Minimal AI involvement - just execute the initialization script
