---
description: Renumber prioritized tasks to start from 1 with no gaps
allowed-tools: [Bash, LS]
---

# /tasks/renumber - Renumber Prioritized Tasks

## Purpose

Renumber all prioritized tasks in `docs/tasks-todo` to maintain their current order but start from 1 with no gaps.

## Usage

```
/tasks:renumber
```

## Execution

1. **List all tasks in the todo folder**

   - Use LS tool on `docs/tasks-todo` directory
   - Filter for files matching pattern `task-[0-9]+-*.md` (ignore `task-x-*.md`)
   - Sort by the current number to preserve order

2. **Create renumbering plan**

   - Extract current numbers and full filenames
   - Map each file to its new number (1, 2, 3, etc.)
   - Display the renumbering plan to user:
     ```
     Renumbering plan:
     task-4-implement-auth.md -> task-1-implement-auth.md
     task-9-fix-bug.md -> task-2-fix-bug.md
     ```

3. **Execute renaming using bash**

   ```bash
   cd docs/tasks-todo

   # Get all numbered tasks, sorted by number
   files=$(ls task-[0-9]*-*.md 2>/dev/null | sort -t- -k2,2n)

   if [ -z "$files" ]; then
     echo "No numbered tasks found to renumber"
     exit 0
   fi

   # Rename to temporary names first to avoid conflicts
   counter=1
   echo "$files" | while read file; do
     # Extract the part after the number (including the dash)
     suffix=$(echo "$file" | sed 's/^task-[0-9]*\(-.*\.md\)$/\1/')
     temp_name="task-temp-${counter}${suffix}"
     mv "$file" "$temp_name"
     ((counter++))
   done

   # Now rename from temp names to final names
   counter=1
   for file in task-temp-*-*.md; do
     if [ -f "$file" ]; then
       # Extract the part after "temp-number"
       suffix=$(echo "$file" | sed 's/^task-temp-[0-9]*\(-.*\.md\)$/\1/')
       final_name="task-${counter}${suffix}"
       mv "$file" "$final_name"
       echo "Renamed to: $final_name"
       ((counter++))
     fi
   done

   echo "Renumbering complete!"
   ```

## Other Rules & Information

- Only renumbers files with numeric priorities (ignores `task-x-*` files)
- Preserves the current order based on existing numbers
- Uses temporary names to avoid conflicts during renaming
- Safe operation - won't overwrite existing files
- Empty todo folder or no numbered tasks will simply report "No numbered tasks found"
