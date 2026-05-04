# Proven Workflow Patterns

Patterns from Anthropic's internal teams and experienced Claude Code users.

---

## The Plan-First Workflow

The highest-leverage workflow for non-trivial tasks.

1. **Explore** (Plan Mode): Read files, understand the codebase
2. **Plan** (Plan Mode): Create detailed implementation plan, Ctrl+G to edit in editor
3. **Implement** (Normal Mode): Code against the plan, run tests
4. **Commit**: Descriptive message, create PR

Skip planning for: typos, single-line fixes, obvious bugs.
Use planning for: multi-file changes, unfamiliar code, architectural decisions.

---

## The Interview Pattern

For large features where requirements are unclear.

```
I want to build [brief description]. Interview me in detail using AskUserQuestion.

Ask about technical implementation, UI/UX, edge cases, concerns, tradeoffs.
Don't ask obvious questions, dig into the hard parts I might not have considered.

Keep interviewing until we've covered everything, then write a complete spec to SPEC.md.
```

Then start a fresh session (`/clear`) to implement from the spec.

---

## The Writer/Reviewer Pattern

Use parallel sessions for quality.

| Session A (Writer) | Session B (Reviewer) |
|---|---|
| Implement the feature | (wait) |
| (wait) | Review the implementation in fresh context |
| Address feedback | (wait) |

Fresh context means the reviewer isn't biased toward code it wrote.

---

## The Fan-Out Pattern

For large migrations or batch operations.

1. Have Claude list all files needing migration
2. Script parallel invocations:
   ```bash
   for file in $(cat files.txt); do
     claude -p "Migrate $file from X to Y. Return OK or FAIL." \
       --allowedTools "Edit,Bash(git commit *)"
   done
   ```
3. Test on 2-3 files, refine prompt, run at scale

---

## The Subagent Investigation Pattern

Keep your main context clean during exploration.

```
Use subagents to investigate:
1. How our authentication system handles token refresh
2. Whether we have existing OAuth utilities
3. What the test coverage looks like for auth

Report findings with specific file:line references.
```

Each investigation runs in separate context. Only summaries return.

---

## Session Management

### Between Tasks
`/clear` between unrelated tasks. Long sessions with irrelevant context reduce performance.

### After Failed Corrections
After 2 failed corrections, `/clear` and write a better initial prompt incorporating what you learned.

### Naming Sessions
`/rename` with descriptive names: "oauth-migration", "debugging-memory-leak"

### Resuming
```bash
claude --continue    # Resume most recent
claude --resume      # Choose from recent sessions
```

---

## Context Management Strategies

### Reduce Context Usage
1. Use subagents for investigation (separate context)
2. Use `disable-model-invocation: true` on rarely-needed skills
3. Move reference material from CLAUDE.md to skills
4. `/clear` between tasks
5. Scope investigations narrowly

### Survive Compaction
Add to CLAUDE.md:
```
When compacting, always preserve:
- The full list of modified files
- Test commands and verification criteria
- Current task description and acceptance criteria
```

### Monitor Context
- `/context` shows context usage and excluded skills
- `SLASH_COMMAND_TOOL_CHAR_BUDGET` env var increases skill description budget (default 15k)
- `CLAUDE_AUTOCOMPACT_PCT_OVERRIDE` triggers compaction earlier (e.g., 50%)

---

## Headless Mode & CI Integration

### One-Off Queries
```bash
claude -p "Explain what this project does"
```

### Structured Output
```bash
claude -p "List all API endpoints" --output-format json
```

### CI Pipeline Integration
```bash
claude -p "Review this PR for security issues" --output-format stream-json
```

### Pre-Commit Hook
```bash
claude -p "Check these staged files for issues: $(git diff --cached --name-only)" \
  --allowedTools "Read,Grep,Glob"
```

---

## Multi-Session Parallel Work

### Local Parallel Sessions
Run 5+ sessions locally, each with own git checkout (not branches, not worktrees).

### Web-Based Sessions
Run sessions on Anthropic's cloud infrastructure in isolated VMs.

### Patterns
- Separate writer from reviewer
- One session writes tests, another writes code to pass them
- Fan out across files for migrations
- Independent research on different subsystems

---

## Prompting Tips

### Be Explicit
- "Can you suggest changes" -> Claude suggests, doesn't implement
- "Change this function to improve performance" -> Claude implements

### Reference Specifics
- Use `@` to reference files
- Point to example patterns in the codebase
- Include error messages and stack traces
- Mention constraints and edge cases

### Provide Verification
- "Run the tests after implementing"
- "Take a screenshot and compare to the original"
- "Fix the root cause, don't suppress the error"

### Rich Input
- Paste images directly
- Give URLs for docs
- Pipe data: `cat error.log | claude`
- Let Claude fetch: "Read the relevant files first"
