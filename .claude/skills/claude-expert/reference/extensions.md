# Claude Code Extension System Reference

## Skills

### What They Are
Skills are the primary extension mechanism. A SKILL.md file with YAML frontmatter and markdown instructions. Claude uses skills when relevant, or you invoke with `/skill-name`. Custom slash commands have been merged into skills.

### Where They Live
| Location | Path | Scope |
|----------|------|-------|
| Enterprise | Managed settings | All org users |
| Personal | `~/.claude/skills/<name>/SKILL.md` | All your projects |
| Project | `.claude/skills/<name>/SKILL.md` | This project only |
| Plugin | `<plugin>/skills/<name>/SKILL.md` | Where plugin enabled |

Priority: enterprise > personal > project. Plugin skills are namespaced.

### Frontmatter Fields
```yaml
---
name: my-skill                    # Becomes /my-skill. Default: directory name
description: What it does         # RECOMMENDED. Claude uses for auto-invocation
argument-hint: [issue-number]     # Shown in autocomplete
disable-model-invocation: true    # User-only (side effects, deploy, etc.)
user-invocable: false             # Claude-only (background knowledge)
allowed-tools: Read, Grep, Glob   # Restrict tool access
model: sonnet                     # Model override
context: fork                     # Run in isolated subagent
agent: Explore                    # Agent type when context: fork
hooks: ...                        # Lifecycle hooks scoped to skill
---
```

### Invocation Matrix
| Frontmatter | User can invoke | Claude can invoke |
|-------------|-----------------|-------------------|
| (default) | Yes | Yes |
| `disable-model-invocation: true` | Yes | No |
| `user-invocable: false` | No | Yes |

### Dynamic Context
`!`command`` runs shell commands before content is sent. Output replaces placeholder.

### String Substitutions
- `$ARGUMENTS` — all args
- `$ARGUMENTS[N]` or `$N` — specific arg by index
- `${CLAUDE_SESSION_ID}` — session ID

### Supporting Files
Keep SKILL.md under 500 lines. Move detail to separate files referenced from SKILL.md.

---

## Subagents

### What They Are
Isolated AI assistants with own context window, custom system prompt, specific tool access, and independent permissions. Run in foreground (blocking) or background (concurrent).

### Built-in Agents
- **Explore**: Haiku, read-only, fast search. Thoroughness: quick/medium/very thorough
- **Plan**: Inherits model, read-only, research for planning
- **general-purpose**: Inherits model, all tools, complex multi-step
- **Bash**: Inherits model, terminal commands
- **Claude Code Guide**: Haiku, answers Claude Code questions

### Where They Live
| Location | Path | Priority |
|----------|------|----------|
| CLI flag | `--agents '{...}'` | 1 (highest) |
| Project | `.claude/agents/` | 2 |
| Personal | `~/.claude/agents/` | 3 |
| Plugin | `<plugin>/agents/` | 4 (lowest) |

### Frontmatter Fields
```yaml
---
name: my-agent                     # Required. Unique identifier
description: When to delegate      # Required. Claude uses for delegation
tools: Read, Grep, Glob, Bash      # Allowlist (inherits all if omitted)
disallowedTools: Write, Edit       # Denylist
model: sonnet                      # sonnet, opus, haiku, inherit
permissionMode: default            # default, acceptEdits, dontAsk, bypassPermissions, plan
skills:                            # Preloaded at startup (full content injected)
  - api-conventions
  - error-handling
hooks:                             # Lifecycle hooks scoped to agent
  PreToolUse: [...]
---
```

### Permission Modes
- `default`: Standard permission checking
- `acceptEdits`: Auto-accept file edits
- `dontAsk`: Auto-deny prompts (explicitly allowed tools still work)
- `bypassPermissions`: Skip all checks (use with caution)
- `plan`: Read-only exploration

### Key Constraints
- Subagents CANNOT spawn other subagents
- Background subagents auto-deny non-pre-approved permissions
- MCP tools not available in background subagents

---

## Hooks

### What They Are
Deterministic scripts that run at specific lifecycle points. Unlike CLAUDE.md (advisory), hooks guarantee execution.

### Hook Events
| Event | Matcher Input | When |
|-------|--------------|------|
| `PreToolUse` | Tool name | Before tool execution |
| `PostToolUse` | Tool name | After tool execution |
| `Stop` | (none) | When Claude finishes |
| `SubagentStart` | Agent type name | When subagent begins |
| `SubagentStop` | (none) | When subagent completes |
| `SessionStart` | (none) | At session start |
| `SessionEnd` | (none) | At session end |
| `UserPromptSubmit` | (none) | When user submits prompt |
| `PreCompact` | (none) | Before compaction |
| `Notification` | (none) | When notification sent |

### Exit Codes
- **0**: Allow (continue normally)
- **2**: Block (stop the tool call, feed error message back to Claude)
- **Other non-zero**: Error (logged but doesn't block)

### Configuration
In `.claude/settings.json`:
```json
{
  "hooks": {
    "PreToolUse": [
      {
        "matcher": "Bash",
        "hooks": [
          { "type": "command", "command": "./scripts/validate.sh" }
        ]
      }
    ]
  }
}
```

### Hook Input
Hooks receive JSON via stdin with tool input details. Use `jq` to extract fields.

---

## MCP Servers

### What They Are
Model Context Protocol servers connect Claude to external services (databases, Slack, browsers, etc.).

### Management
```bash
claude mcp add <name> <command> [args...]    # Add server
claude mcp remove <name>                      # Remove
claude mcp list                               # List configured
/mcp                                          # Check status in session
```

### Scope
local > project > user

### Context Cost
Tool definitions load at session start. Tool search (default) defers tools beyond 10% of context.

---

## Plugins

### What They Are
Bundles of skills, hooks, agents, and MCP servers. Namespaced (plugin-name:skill-name). Installable via `/plugin`.

### Structure
```
plugin-name/
  .claude-plugin/
    plugin.json          # Manifest (required)
  commands/              # Slash commands
  agents/                # Custom agents
  skills/                # Skills
  hooks/                 # Event handlers (hooks.json)
  .mcp.json              # MCP server configs
```

### Installation
```
/plugin                  # Browse marketplace
/plugin install <url>    # Install from URL
```
