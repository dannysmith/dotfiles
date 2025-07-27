---
allowed-tools: Read, LS
description: Create a new custom slash command with best practices
---

# Task: Create a New Custom Slash Command

## Input

`$ARGUMENTS`

## Process

1. **Understand the user's intent**

   - Infer appropriate command name and description from the input
   - Command name should be kebab-case

2. **Create the command file**

   - Location: `.claude/commands/<command-name>.md`
   - Start with minimal structure using template below
   - Only add complexity if needed

3. Create the most appropriate command structure for the user's needs.

## Important Guidelines

- **Keep instructions concise** - Long instructions may be partially understood
- **Start simple**
- **Avoid over-specification** - Don't add allowed-tools unless necessary
- **Focus on clarity** - Simple, direct instructions work best

## Template

```markdown
---
description: [Command description]
---

# /[command-name] - [Natural Language Command Name]

## Purpose

[Command description]

## Usage

[Usage example including arguments (in unix-style)]

## Arguments

[List available arguments, omit section if none]

## Execution

[Execution steps]

## Other Rules & Information

[Any other **critical** info or rules]
```

## Example

````md
---
allowed-tools: [Read, Bash, Glob, TodoWrite, Edit, Write]
description: 'Execute tests, generate comprehensive test reports, and maintain test coverage standards.'
---

# /test - - Testing and Quality Assurance

## Purpose

Execute tests, generate comprehensive test reports, and maintain test coverage standards.

## Usage

\```

/test [target] [--type unit|integration|e2e|all] [--coverage]

\```

## Arguments

- `target` - Specific tests, files, or entire test suite
- `--type` - Test type (unit, integration, e2e, all)
- `--coverage` - Generate coverage reports

## Execution

1. Discover and categorize available tests
2. Execute tests with appropriate configuration
3. Monitor test results and collect metrics
4. Generate comprehensive test reports

## Other Rules & Information

- This command must be executed in the current project, though it's a generic global command (in `~/.claude/commands`) so does not reference the specifics of this project.
````
