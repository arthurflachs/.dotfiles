---
description: Bootstrap /create-spec and /create-mock commands for a project
arguments:
  - name: project
    description: Path to target project (optional, defaults to current directory)
---

# Bootstrap Feature Development Commands

Set up a complete feature development workflow for any project by generating customized `/create-spec` and `/create-mock` commands.

**This command orchestrates both generators in sequence, sharing analysis between them for consistency.**

---

## Overview

This meta-command will:

1. **Analyze** your project structure, UI stack, and conventions
2. **Generate** a `/create-spec` command tailored to your workflow
3. **Generate** a `/create-mock` command matching your UI patterns
4. **Create** supporting templates and utilities
5. **Document** usage in your project

---

## Phase 1: Comprehensive Project Analysis

### Step 1.1: Structure Analysis

**Use Task tool with Explore agent** to analyze:

**Project Structure**:
- Monorepo vs single package
- Framework (Next.js, React, Vue, etc.)
- Feature folder location and naming
- Documentation location

**UI Stack**:
- Component library (shadcn/ui, MUI, custom, etc.)
- Styling (Tailwind, CSS Modules, etc.)
- Data fetching (React Query, SWR, etc.)
- State management

**Integrations**:
- Ticket system (Notion, Linear, GitHub, etc.)
- MCP servers available
- Design tools

### Step 1.2: Pattern Extraction

Search for existing patterns:
- Spec documents
- Component structures
- Mock data patterns
- Empty/loading/error state implementations

### Step 1.3: Present Unified Analysis (REQUIRED)

**Use AskUserQuestion** to confirm all findings at once:

```
## Project Analysis Summary

### Structure
- Type: {monorepo/single}
- Framework: {detected}
- Features: {path}
- Naming: {convention}

### UI Stack
- Components: {library}
- Styling: {system}
- Data: {library}

### Integrations
- Tickets: {system or none detected}
- Design docs: {path or none}

### Detected Patterns
- Existing specs: {yes/no}
- State components: {pattern or none}
- Mock data: {pattern or none}

Questions:
1. Is this analysis correct?
2. What ticket system do you use? (if not detected)
3. Any conventions I should follow?
4. Additional requirements?
```

**DO NOT proceed until confirmed.**

---

## Phase 2: Generate Commands

### Step 2.1: Create Project .claude Directory

```bash
mkdir -p {project}/.claude/commands
mkdir -p {project}/.claude/templates
```

### Step 2.2: Generate /create-spec Command

Using the shared analysis, generate a spec command that:
- Integrates with detected ticket system
- Follows project naming conventions
- Outputs to correct location
- Uses project-specific template

### Step 2.3: Generate /create-mock Command

Using the shared analysis, generate a mock command that:
- Uses detected UI component library
- Follows project file structure
- Includes appropriate state components
- Matches detected mock patterns

### Step 2.4: Create Supporting Files

Generate all supporting files:
- Spec template (`.claude/templates/spec-template.md`)
- Mock patterns doc (if needed)
- Mock hook utility (if not exists)

---

## Phase 3: Integration & Documentation

### Step 3.1: Update CLAUDE.md (if exists)

If the project has a CLAUDE.md, suggest adding:

```markdown
## Feature Development Workflow

Use these commands for consistent feature development:

### /create-spec
Generate a technical specification from a {ticket-system} ticket.
```
/create-spec ticket=<url>
```

### /create-mock
Create UI mocks with all states (loading, error, empty, data).
```
/create-mock spec=path/to/spec.md
# or
/create-mock name=feature-name
```

### Workflow
1. Start with `/create-spec` to define requirements
2. Use `/create-mock` to prototype UI
3. Replace mock hooks with real API calls
```

### Step 3.2: Create Local Documentation

Create `.claude/README.md`:

```markdown
# Claude Code Commands

## Available Commands

### /create-spec
Generates technical specifications from tickets.

**Arguments**:
- `ticket`: {Ticket system} URL or ID
- `name`: Feature name override (optional)
- `output`: Output path override (optional)

**Output**: `{spec-output-path}`

### /create-mock
Creates UI mocks with all states.

**Arguments**:
- `spec`: Path to spec file (optional)
- `name`: Feature name (optional if spec provided)

**Output**: `{features-path}/{feature-name}/`

## Templates

- `templates/spec-template.md` - Spec document template
- {additional templates}

## Customization

Edit the command files to adjust:
- Sections included in specs
- States generated for mocks
- Output paths and naming
- Integration patterns
```

---

## Phase 4: Verify & Summarize

### Step 4.1: Validate All Files

Verify created files:
- `.claude/commands/create-spec.md`
- `.claude/commands/create-mock.md`
- `.claude/templates/spec-template.md`
- Any additional files

### Step 4.2: Present Final Summary

```
## Feature Commands Bootstrapped Successfully

### Files Created

**Commands**:
- {project}/.claude/commands/create-spec.md
- {project}/.claude/commands/create-mock.md

**Templates**:
- {project}/.claude/templates/spec-template.md
{additional templates}

### Quick Start

**Create a spec**:
/create-spec ticket={example-url}

**Create a mock**:
/create-mock name=my-feature

**Full workflow**:
1. /create-spec ticket=<url>
2. Review and approve spec
3. /create-mock spec=<spec-path>
4. Review and implement mock
5. Replace mocks with real API

### Customization

- Edit commands in `.claude/commands/`
- Modify templates in `.claude/templates/`
- Add to CLAUDE.md for team visibility

### Next Steps

1. Try `/create-spec` with a real ticket
2. Test `/create-mock` with a simple feature
3. Share with your team via git
```

---

## Workflow Diagram

```
┌─────────────────────────────────────────────────────────────┐
│                  /bootstrap-feature-commands                │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    Phase 1: Analysis                        │
│  • Project structure    • UI stack    • Integrations        │
│  • Existing patterns    • Conventions • Templates           │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                  Phase 2: Generation                        │
│                                                             │
│  ┌──────────────────┐    ┌──────────────────┐              │
│  │  /create-spec    │    │  /create-mock    │              │
│  │  • Ticket fetch  │    │  • UI patterns   │              │
│  │  • Spec template │    │  • State comps   │              │
│  │  • Output path   │    │  • Mock hooks    │              │
│  └──────────────────┘    └──────────────────┘              │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                Phase 3: Documentation                       │
│  • CLAUDE.md updates    • README    • Usage examples        │
└─────────────────────────────────────────────────────────────┘
```

---

## What You Get

After running this command, your project will have:

### /create-spec
A phased workflow that:
1. Fetches requirements from your ticket system
2. Explores codebase for related code
3. Researches UX best practices
4. Clarifies ambiguities with you
5. Generates a structured spec document

### /create-mock
A phased workflow that:
1. Reads specs or gathers requirements
2. Identifies integration points
3. Maps user flows and edge cases
4. Designs UI with your components
5. Generates all state components
6. Integrates into your app

### Consistent Patterns
- Same naming conventions throughout
- Matching file structures
- Coordinated templates
- Shared mock utilities

### Easy Customization
- All files in `.claude/` are editable
- Templates can be modified
- Commands can be extended
- Patterns can evolve with your project
