---
description: Initialize a simple file-based task management system
allowed-tools: [Bash]
---

# /tasks/init - Initialize Task Management System

## Purpose

Set up a simple file-based task management system with todo and done folders.

For projects with package.json, this also creates a completion script and adds npm scripts (task:complete, task:rename-done) to help manage task completion with automatic date-stamping.

## Usage

```
/g:tasks:init
```

## Instructions

Execute ONE bash command that performs all of the following. Do not break this into multiple commands.

### What the command must do:

1. **Create directories**: docs/tasks-done and docs/tasks-todo

2. **Create docs/tasks.md** with documentation about the task management system. This file should include:
   - An overview explaining the naming conventions (task-NUMBER-name.md for todo, task-YYYY-MM-DD-name.md for done)
   - If package.json exists: Add a section explaining how to use the completion script

3. **Create example task**: docs/tasks-todo/task-1-example.md

4. **Update CLAUDE.md** (if it exists and doesn't already have the reference): Add "See @docs/tasks.md for task management" at the top

5. **If package.json exists in the project**:
   - Create scripts/ directory
   - Create scripts/complete-task.js (the JavaScript code for this is provided below)
   - Make it executable (chmod +x)
   - Add two npm scripts to package.json: "task:complete" and "task:rename-done"

### Implementation

Copy and execute this exact bash command:

```bash
mkdir -p docs/tasks-done docs/tasks-todo && \
if [ -f "package.json" ]; then HAS_PKG=true; else HAS_PKG=false; fi && \
if [ "$HAS_PKG" = true ]; then \
cat > docs/tasks.md << 'TASKS_DOC_EOF'
# Task Management

## Overview

- **Uncompleted tasks** are in tasks-todo/
  - Named task-NUMBER-name.md where NUMBER indicates priority order
  - The lowest number is the current task
  - If NUMBER is x, the task has not been prioritized yet
- **Completed tasks** are in tasks-done/
  - Named task-YYYY-MM-DD-name.md with completion date

## Completing Tasks

When you finish a task, use the completion script.

Usage: pnpm task:complete TASK_NAME_OR_NUMBER

Examples:
  pnpm task:complete frontend-performance
  pnpm task:complete 2
  pnpm task:complete awesome-feature

The script will:
1. Find the matching task in tasks-todo/
2. Strip the task-NUMBER- prefix
3. Add todays date prefix: task-YYYY-MM-DD-
4. Move it to tasks-done/

Example transformation:
  tasks-todo/task-2-frontend-performance-optimization.md
  becomes
  tasks-done/task-2025-11-01-frontend-performance-optimization.md

### Renaming Existing Completed Tasks

If you have existing completed tasks without dates, rename them using their last modified date:

Usage: pnpm task:rename-done
TASKS_DOC_EOF
else \
cat > docs/tasks.md << 'TASKS_DOC_EOF'
# Task Management

## Overview

- **Uncompleted tasks** are in tasks-todo/
  - Named task-NUMBER-name.md where NUMBER indicates priority order
  - The lowest number is the current task
  - If NUMBER is x, the task has not been prioritized yet
- **Completed tasks** are in tasks-done/
  - Named task-YYYY-MM-DD-name.md with completion date
TASKS_DOC_EOF
fi && \
echo "# Task: Example Task Doc" > docs/tasks-todo/task-1-example.md && \
if [ -f "CLAUDE.md" ]; then \
  if ! grep -q "@docs/tasks.md" CLAUDE.md; then \
    echo "See @docs/tasks.md for task management" > CLAUDE.md.tmp && \
    echo "" >> CLAUDE.md.tmp && \
    cat CLAUDE.md >> CLAUDE.md.tmp && \
    mv CLAUDE.md.tmp CLAUDE.md && \
    echo "Updated CLAUDE.md with task reference"; \
  else \
    echo "CLAUDE.md already contains task reference"; \
  fi; \
else \
  echo "No CLAUDE.md found - skipping update"; \
fi && \
if [ "$HAS_PKG" = true ]; then \
  echo "Detected package.json - setting up task completion script..." && \
  mkdir -p scripts && \
  cat > scripts/complete-task.js << 'COMPLETE_TASK_SCRIPT_EOF'
#!/usr/bin/env node

import fs from 'fs'
import path from 'path'
import { fileURLToPath } from 'url'

const __filename = fileURLToPath(import.meta.url)
const __dirname = path.dirname(__filename)

const DOCS_DIR = path.join(__dirname, '..', 'docs')
const TODO_DIR = path.join(DOCS_DIR, 'tasks-todo')
const DONE_DIR = path.join(DOCS_DIR, 'tasks-done')

function formatDate(date) {
  const year = date.getFullYear()
  const month = String(date.getMonth() + 1).padStart(2, '0')
  const day = String(date.getDate()).padStart(2, '0')
  return `${year}-${month}-${day}`
}

function getLastModifiedDate(filePath) {
  const stats = fs.statSync(filePath)
  return new Date(stats.mtime)
}

function stripTaskNumber(filename) {
  let cleaned = filename.replace(/^task-[0-9x]+-/, '')
  cleaned = cleaned.replace(/^task-/, '')
  return cleaned
}

function addDatePrefix(filename, date) {
  const dateStr = formatDate(date)
  const nameWithoutTaskPrefix = stripTaskNumber(filename)
  return `task-${dateStr}-${nameWithoutTaskPrefix}`
}

function renameExistingTasks() {
  console.log('Renaming existing completed tasks...\n')

  const files = fs.readdirSync(DONE_DIR)
  const taskFiles = files.filter(f => f.endsWith('.md'))

  let renamedCount = 0
  let skippedCount = 0

  taskFiles.forEach(filename => {
    const oldPath = path.join(DONE_DIR, filename)

    if (/^task-\d{4}-\d{2}-\d{2}-/.test(filename)) {
      console.log(`Skipping (already dated): ${filename}`)
      skippedCount++
      return
    }

    const modifiedDate = getLastModifiedDate(oldPath)
    const newFilename = addDatePrefix(filename, modifiedDate)
    const newPath = path.join(DONE_DIR, newFilename)

    fs.renameSync(oldPath, newPath)
    console.log(`${filename} -> ${newFilename}`)
    renamedCount++
  })

  console.log(`\nSummary:`)
  console.log(`  Renamed: ${renamedCount}`)
  console.log(`  Skipped: ${skippedCount}`)
  console.log(`  Total:   ${taskFiles.length}`)
}

function completeTask(taskIdentifier) {
  console.log(`Completing task: ${taskIdentifier}\n`)

  const todoFiles = fs.readdirSync(TODO_DIR)
  const matchingFile = todoFiles.find(f => {
    const normalized = f.toLowerCase().replace('.md', '')
    const searchTerm = taskIdentifier.toLowerCase()
    return normalized.includes(searchTerm) || normalized.endsWith(searchTerm)
  })

  if (!matchingFile) {
    console.error(`Error: No task found matching "${taskIdentifier}"`)
    console.error(`\nAvailable tasks in tasks-todo/:`)
    todoFiles
      .filter(f => f.endsWith('.md'))
      .forEach(f => console.error(`   - ${f}`))
    process.exit(1)
  }

  const oldPath = path.join(TODO_DIR, matchingFile)
  const todayDate = new Date()
  const newFilename = addDatePrefix(matchingFile, todayDate)
  const newPath = path.join(DONE_DIR, newFilename)

  if (fs.existsSync(newPath)) {
    console.error(`Error: Task already exists in tasks-done: ${newFilename}`)
    process.exit(1)
  }

  fs.renameSync(oldPath, newPath)

  console.log(`Task completed!`)
  console.log(`   From: tasks-todo/${matchingFile}`)
  console.log(`   To:   tasks-done/${newFilename}`)
  console.log(`   Date: ${formatDate(todayDate)}`)
}

function showHelp() {
  console.log(`
Task Completion Script

Usage:
  pnpm task:complete TASK_NAME       Complete a task
  pnpm task:rename-done              Rename all existing completed tasks

Examples:
  pnpm task:complete frontend-performance
  pnpm task:complete 2
  pnpm task:rename-done

Notes:
  - Task name can be partial
  - Completed tasks are moved to tasks-done/ with format: task-YYYY-MM-DD-description.md
  - Existing tasks are renamed using their last modified date
`)
}

const args = process.argv.slice(2)

if (args.includes('--help') || args.includes('-h')) {
  showHelp()
  process.exit(0)
}

if (args.includes('--rename-existing')) {
  renameExistingTasks()
} else if (args.length === 0) {
  console.error('Error: No task specified\n')
  showHelp()
  process.exit(1)
} else {
  const taskIdentifier = args.join(' ')
  completeTask(taskIdentifier)
}
COMPLETE_TASK_SCRIPT_EOF
  chmod +x scripts/complete-task.js && \
  node -e "const fs = require('fs'); const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8')); if (!pkg.scripts) pkg.scripts = {}; pkg.scripts['task:complete'] = 'node scripts/complete-task.js'; pkg.scripts['task:rename-done'] = 'node scripts/complete-task.js --rename-existing'; fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2) + '\n'); console.log('Added task:complete and task:rename-done scripts to package.json');" ; \
else \
  echo "No package.json found - skipping completion script setup"; \
fi && \
echo "Task management system initialized successfully!"
```

## After Execution

Report to the user what was created:
- docs/tasks-todo/ and docs/tasks-done/ directories
- docs/tasks.md documentation file
- Example task file
- If package.json exists: completion script and npm scripts

## Notes

- This uses heredocs with carefully chosen EOF delimiters (TASKS_DOC_EOF, COMPLETE_TASK_SCRIPT_EOF) to avoid conflicts
- All operations are in a single bash command for atomicity
- The completion script is only created for projects with package.json
- Minimal AI decision-making required - just execute the provided command
