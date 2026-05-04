# Claude Code Templates

Ready-to-use templates for common Claude Code extension patterns.

---

## Skill Templates

### Basic Reference Skill (auto-invoked knowledge)
```yaml
---
name: my-conventions
description: [Domain] conventions for this codebase. Use when writing [domain] code.
---

When writing [domain] code:
- [Convention 1]
- [Convention 2]
- [Convention 3]
```

### User-Invocable Workflow Skill
```yaml
---
name: deploy
description: Deploy the application to production
disable-model-invocation: true
---

Deploy $ARGUMENTS to production:

1. Run the test suite: `npm test`
2. Build the application: `npm run build`
3. Push to deployment target
4. Verify deployment succeeded
5. Report results
```

### Skill with Dynamic Context
```yaml
---
name: pr-summary
description: Summarize the current pull request
context: fork
agent: Explore
allowed-tools: Bash(gh *)
---

## Pull request context
- PR diff: !`gh pr diff`
- PR comments: !`gh pr view --comments`
- Changed files: !`gh pr diff --name-only`

## Task
Summarize this pull request. Focus on:
1. What changed and why
2. Key design decisions
3. Potential risks or concerns
```

### Interactive Skill with AskUserQuestion
```yaml
---
name: code-review
description: Run a structured code review
disable-model-invocation: true
allowed-tools: Read, Grep, Glob, AskUserQuestion, Bash(git *)
---

# Code Review

Review $ARGUMENTS following this checklist:

1. Read all modified files
2. Check each file for:
   - Logic errors
   - Security vulnerabilities
   - Performance concerns
   - Code style violations
3. Use AskUserQuestion to confirm priority of findings
4. Present findings organized by severity
```

### Skill with Supporting Files
```
my-skill/
  SKILL.md              # Keep under 500 lines
  reference.md          # Detailed docs
  template.md           # Template for output
  examples/sample.md    # Example output
```

SKILL.md:
```yaml
---
name: my-skill
description: Does the thing
---

# My Skill

Do the thing following these instructions.

## References
- For complete API details, see [reference.md](reference.md)
- For output format, see [template.md](template.md)
- For example output, see [examples/sample.md](examples/sample.md)
```

---

## Subagent Templates

### Read-Only Code Reviewer
```yaml
---
name: code-reviewer
description: Expert code review. Use proactively after code changes.
tools: Read, Grep, Glob, Bash
model: sonnet
---

You are a senior code reviewer.

When invoked:
1. Run git diff to see recent changes
2. Focus on modified files
3. Review for: clarity, naming, duplication, error handling, security, tests, performance
4. Organize feedback by priority: Critical > Warnings > Suggestions
5. Include specific examples of how to fix issues
```

### Debugger Agent
```yaml
---
name: debugger
description: Debugging specialist for errors and test failures. Use proactively when encountering issues.
tools: Read, Edit, Bash, Grep, Glob
---

You are an expert debugger.

When invoked:
1. Capture error message and stack trace
2. Identify reproduction steps
3. Isolate the failure location
4. Implement minimal fix
5. Verify solution works

Focus on fixing the underlying issue, not symptoms.
```

### Research Agent (Haiku for Speed)
```yaml
---
name: researcher
description: Fast codebase research. Use when exploring unfamiliar code.
tools: Read, Grep, Glob
model: haiku
---

You are a codebase researcher. Find and summarize information quickly.

When invoked:
1. Search for relevant files using Glob and Grep
2. Read key files
3. Summarize findings with specific file:line references
4. Note any related files worth investigating
```

### Database Query Agent with Hook Validation
```yaml
---
name: db-reader
description: Execute read-only database queries for analysis.
tools: Bash
hooks:
  PreToolUse:
    - matcher: "Bash"
      hooks:
        - type: command
          command: "./scripts/validate-readonly-query.sh"
---

You are a database analyst with read-only access. Execute SELECT queries only.

When asked to analyze data:
1. Identify relevant tables
2. Write efficient SELECT queries
3. Present results with context

You cannot modify data. Explain if asked to INSERT, UPDATE, DELETE, or modify schema.
```

---

## Hook Templates

### Post-Edit Linting
```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          { "type": "command", "command": "npx eslint --fix ${TOOL_INPUT_FILE}" }
        ]
      }
    ]
  }
}
```

### Block Writes to Protected Files
```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          { "type": "command", "command": "./scripts/protect-files.sh" }
        ]
      }
    ]
  }
}
```

### Session Start Context Injection
```json
{
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          { "type": "command", "command": "echo 'Current sprint: $(cat .sprint-context.md)'" }
        ]
      }
    ]
  }
}
```

---

## CLAUDE.md Template

```markdown
# Project Name

## Build & Test
- `npm run dev` — start dev server
- `npm test` — run test suite
- `npm run lint` — run linter

## Code Style
- [Rule that differs from defaults]
- [Rule that differs from defaults]

## Architecture
- [Key architectural decision Claude needs to know]
- [Non-obvious behavior or gotcha]

## Workflow
- [How to verify changes]
- [Branch naming convention]
- [PR convention]

## Skills
See @.claude/skills/ for domain-specific knowledge and workflows.
```

---

## Permission Configuration

### settings.json — Allow specific tools
```json
{
  "permissions": {
    "allow": [
      "Bash(npm run *)",
      "Bash(git *)",
      "Bash(gh *)",
      "Skill(deploy *)"
    ],
    "deny": [
      "Bash(rm -rf *)",
      "Task(Explore)"
    ]
  }
}
```
