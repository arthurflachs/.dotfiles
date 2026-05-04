---
description: Generate a project-specific /create-spec command by analyzing codebase structure and conventions
arguments:
  - name: project
    description: Path to the target project (optional, defaults to current directory)
---

# Generate Create-Spec Command

Generate a customized `/create-spec` command for any project. This meta-command analyzes your codebase structure, conventions, and workflows to produce a tailored spec-writing command.

**CRITICAL**: This is a phased workflow that produces a high-quality, project-specific command. Do NOT skip phases.

---

## Phase 1: Project Analysis

### Step 1.1: Identify Project Structure

**Use Task tool with Explore agent** to analyze the target project:

1. **Project Type**:
   - Is this a monorepo or single package?
   - What framework(s) are used? (Next.js, React, Vue, etc.)
   - What's the folder structure convention?

2. **Feature Organization**:
   - Where do features live? (`src/features/`, `apps/web/features/`, `modules/`, etc.)
   - How are features named? (kebab-case, PascalCase, etc.)
   - What files make up a typical feature?

3. **Documentation Patterns**:
   - Are there existing specs or design docs?
   - Where is documentation stored?
   - What format is used? (Markdown, ADRs, etc.)

4. **External Integrations**:
   - Is there Notion integration? Linear? Jira?
   - What tools are used for ticket tracking?
   - Are there existing fetch/import patterns?

Document findings:
```
## Project Analysis

### Structure
- Type: {monorepo/single}
- Framework: {framework}
- Features location: {path}
- Naming convention: {kebab-case/PascalCase/etc}

### Documentation
- Existing docs: {path or none}
- Format: {markdown/etc}

### Integrations
- Ticket system: {notion/linear/jira/none}
- MCP servers available: {list}
```

### Step 1.2: Find Existing Patterns

Search for existing specifications or similar documentation:

```
Look for:
- SPEC_*.md files
- README.md in feature folders
- docs/ directories
- .md files with structured content
```

If found, analyze the format and extract the pattern.

### Step 1.3: Present Analysis (REQUIRED)

**Use AskUserQuestion** to present findings and gather input:

```
Based on my analysis of your project:

**Structure**: {summary}
**Features Location**: {path}
**Documentation**: {existing or none}
**Ticket System**: {detected or ask}

Questions:
1. Is this the correct feature location: {path}?
2. What ticket/issue system do you use? (Notion/Linear/Jira/GitHub/None)
3. Do you have existing spec templates I should follow?
4. Any specific sections you always want in specs?
```

**DO NOT proceed until user confirms analysis.**

---

## Phase 2: Customize Template

### Step 2.1: Determine Spec Sections

Based on project needs, determine which sections to include:

**Standard Sections** (always include):
- Overview (3-7 behavior statements)
- Key Concepts (domain terms)
- Core Logic/Behavior
- User Feedback & Visibility (states)
- Non-Goals (v1)

**Optional Sections** (based on project):
- User Configuration/Settings (if feature has settings)
- Technical Notes (if complex integrations)
- API Reference (if backend-focused)
- Migration Guide (if replacing existing feature)
- Security Considerations (if auth/data sensitive)
- Testing Strategy (if TDD workflow)

### Step 2.2: Define Ticket Integration

Based on detected/selected ticket system:

**Notion**:
```markdown
### Step X: Fetch Ticket
Use `notion-fetch` tool with the provided URL.
Extract Shape Up sections: Problem, Solution, Rabbit Holes, No-gos.
```

**Linear**:
```markdown
### Step X: Fetch Issue
Use Linear MCP tool to fetch issue details.
Extract: Title, Description, Labels, Priority.
```

**GitHub Issues**:
```markdown
### Step X: Fetch Issue
Use GitHub MCP to read issue #{number}.
Extract: Title, Body, Labels, Milestone.
```

**None/Manual**:
```markdown
### Step X: Gather Requirements
Use AskUserQuestion to collect:
- Feature name and purpose
- Key user stories
- Known constraints
- Success criteria
```

### Step 2.3: Configure Output Path

Determine where specs should be written:

```
Examples:
- apps/web/features/{feature-name}/SPEC_{feature-name}.md
- src/features/{feature-name}/spec.md
- docs/specs/{feature-name}.md
- {feature-path}/README.md
```

### Step 2.4: User Validation (REQUIRED)

**Use AskUserQuestion** to confirm customizations:

```
Here's the planned spec command structure:

**Ticket Source**: {source}
**Output Path**: {path pattern}
**Required Sections**: {list}
**Optional Sections**: {list based on detection}

Do you want to:
1. Add/remove any sections?
2. Change the output path pattern?
3. Add any project-specific requirements?
```

**DO NOT proceed until user approves.**

---

## Phase 3: Generate Command

### Step 3.1: Create Directory Structure

```bash
mkdir -p {project}/.claude/commands
mkdir -p {project}/.claude/templates
```

### Step 3.2: Generate Spec Template

Create `{project}/.claude/templates/spec-template.md` with:
- All confirmed sections
- Project-specific placeholders
- Comment instructions

### Step 3.3: Generate Command File

Create `{project}/.claude/commands/create-spec.md` with:

**Structure**:
```markdown
---
description: Generate a technical spec for {project-name}
arguments:
  - name: ticket
    description: {Ticket system} URL or ID
  - name: name
    description: Feature name override (optional, derived from ticket)
  - name: output
    description: Output path override (optional)
---

# Create Spec

{Project-specific intro}

## Pre-Phase: Input Resolution
{Ticket fetching logic}

## Phase 1: Extract & Understand
{Requirements extraction}

## Phase 2: Research & Explore
{Codebase analysis}
{UX research if applicable}

## Phase 3: Clarify & Validate
{Ambiguity resolution}

## Phase 4: Generate Spec
{Template application}
{File writing}
```

### Step 3.4: Adapt to Project Conventions

Replace generic patterns with project-specific ones:

| Generic | Project-Specific |
|---------|-----------------|
| `apps/web/features/` | `{detected-path}` |
| `kebab-case` | `{detected-naming}` |
| `react-query` | `{detected-data-lib}` |
| `@shared/ui` | `{detected-ui-lib}` |

### Step 3.5: Include Referenced Files

If the command references templates or patterns:
- Include file paths relative to project root
- Use `@` syntax for file references
- Document any dependencies

---

## Phase 4: Verify & Finalize

### Step 4.1: Validate Generated Files

Check that all files were created:
- `.claude/commands/create-spec.md`
- `.claude/templates/spec-template.md`

### Step 4.2: Test Syntax

Read back the generated command and verify:
- YAML frontmatter is valid
- Arguments are properly defined
- Phase structure is clear
- File references use correct paths

### Step 4.3: Present Summary

```
## Command Generated Successfully

**Files Created**:
- {project}/.claude/commands/create-spec.md
- {project}/.claude/templates/spec-template.md

**Usage**:
/create-spec ticket=<url> [name=feature-name]

**Features**:
- {Ticket system} integration
- Phased workflow with user validation
- Project-specific output path: {path}
- Sections: {list}

**Next Steps**:
1. Review the generated command
2. Test with a real ticket
3. Customize further if needed
4. Consider running /generate-create-mock for UI workflow
```

---

## Generated Command Template

Below is the base template that will be customized:

```markdown
---
description: Generate a technical spec from a {ticket-system} ticket
arguments:
  - name: ticket
    description: {Ticket system} ticket URL or ID
  - name: name
    description: Feature name override in {naming-convention} (optional)
  - name: output
    description: Output path override (optional, default {default-output-path})
---

# Create Spec

Generate a comprehensive technical specification for this project.

**CRITICAL**: This is a phased workflow. Each phase requires user validation.

---

## Phase 1: Extract & Understand

### Step 1.1: Fetch Ticket
{ticket-fetch-instructions}

### Step 1.2: Parse Requirements
From the ticket, identify:
1. **Feature Type**: New feature, Enhancement, Bug fix
2. **Key Entities**: Data objects mentioned
3. **User Personas**: Who uses this?
4. **Primary Actions**: What can users do?
5. **Constraints**: Technical limitations
6. **Non-Goals**: Out of scope

### Step 1.3: Derive Feature Name
Convert ticket title to {naming-convention}:
- "{example-title}" -> `{example-name}`

### Step 1.4: Present Understanding (REQUIRED)
**Use AskUserQuestion** to confirm understanding before proceeding.

---

## Phase 2: Research & Explore

### Step 2.1: Codebase Exploration
**Use Task tool with Explore agent**:
- Find related features in `{features-path}`
- Identify reusable patterns
- Check for existing types/interfaces

### Step 2.2: Integration Analysis
Determine where this feature fits:
- Entry point location
- Navigation changes needed
- Pages to modify

---

## Phase 3: Clarify & Validate

### Step 3.1: Identify Ambiguities
List unclear points from Phase 1 & 2.

### Step 3.2: User Clarification (REQUIRED)
**Use AskUserQuestion** with specific questions and suggestions.

### Step 3.3: Confirm Decisions
Get explicit approval before generating spec.

---

## Phase 4: Generate Spec

### Step 4.1: Create Feature Folder
```
{features-path}/{feature-name}/
```

### Step 4.2: Write Spec File
Use template at `.claude/templates/spec-template.md`

Write to: `{output-path-pattern}`

### Step 4.3: Present Summary
Show file location and offer next steps.
```

---

## Customization Points

The generator will customize these based on analysis:

1. **{ticket-system}**: Notion, Linear, GitHub, Jira, Manual
2. **{ticket-fetch-instructions}**: Tool-specific fetch commands
3. **{features-path}**: Detected feature folder location
4. **{naming-convention}**: kebab-case, PascalCase, etc.
5. **{output-path-pattern}**: Where specs are written
6. **{example-title}** / **{example-name}**: Naming examples
