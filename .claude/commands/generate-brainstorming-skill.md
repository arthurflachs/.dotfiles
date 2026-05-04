---
description: Generate a custom brainstorming skill through interactive multi-round research
arguments:
  - name: domain
    description: Domain focus (generic, product-ux, ui-design, api-contract, api-architecture, frontend, fullstack, or custom)
  - name: name
    description: Custom skill name in kebab-case (optional, derived from domain)
---

# Generate Brainstorming Skill

Create a domain-specific brainstorming skill through an interactive, research-driven process. This meta-command conducts multiple research rounds with user validation to ensure the generated skill is well-suited to your needs.

**CRITICAL**: This is a highly interactive workflow. Each research round requires user validation. Maximum 5 research rounds.

---

## Pre-Phase: Domain Selection

### If `domain` argument provided:

Map to known domains and their technique libraries:

| Domain | Focus | Core Techniques |
|--------|-------|-----------------|
| `generic` | General problem-solving | SCAMPER, Mind Mapping, How Might We, Reverse Brainstorming |
| `product-ux` | Product/UX/UI ideation | Design Thinking, User Story Mapping, OST, JTBD |
| `ui-design` | Pure UI/visual design | Crazy Eights, Moodboarding, Design Studio Method |
| `api-contract` | API schema/contract design | Schema-first, Request/Response, Error mapping |
| `api-architecture` | API/backend architecture | Event Storming, ADR, Bounded Contexts |
| `frontend` | Frontend architecture | Atomic Design, State Mapping, Accessibility-first |
| `fullstack` | Full-stack systems | C4 Model, Trade-off Analysis, Integration mapping |
| `custom` | User-defined | Research from scratch |

### If `domain` NOT provided:

**Use AskUserQuestion** to identify the domain:

```
What type of brainstorming skill do you need?

Options:
1. Generic - General problem-solving and ideation
2. Product/UX/UI - Product strategy and user experience
3. Pure UI/Design - Visual design and interface ideation
4. API Contract - API schema and contract design
5. API Architecture - Backend architecture and domain modeling
6. Frontend - Frontend architecture and component design
7. Full-Stack - End-to-end system design
8. Custom - I'll describe my specific needs
```

---

## Phase 1: Discovery & Multi-Round Research

**CRITICAL**: This phase uses iterative research with user validation after EACH round. Continue until user says "ready" or maximum 5 rounds reached.

### Step 1.1: Initial Context Gathering

**Use AskUserQuestion** to understand the user's specific needs:

```
Before I start researching, help me understand your context:

1. What types of problems will you brainstorm with this skill?
   (e.g., "new feature ideas", "architecture decisions", "API designs")

2. Who are the primary users of this skill?
   (e.g., "solo developer", "product team", "tech lead")

3. What's your typical brainstorming context?
   (e.g., "greenfield projects", "existing codebase", "client requirements")

4. Any specific techniques you already like or want to include?
```

Document the answers for use in research.

### Step 1.2: Research Round Loop

```
FOR each research round (1 to 5):

  ┌─────────────────────────────────────────────────────────────┐
  │ STEP A: RESEARCH                                            │
  │                                                             │
  │ Use WebSearch to find:                                      │
  │ - Latest techniques for {domain} brainstorming 2025         │
  │ - {domain} ideation best practices                          │
  │ - AI-assisted {domain} brainstorming patterns               │
  │                                                             │
  │ Use Task tool with Explore agent to find:                   │
  │ - Similar patterns in the codebase                          │
  │ - Existing skills/commands that could inform this one       │
  │ - How other features handle phased workflows                │
  │                                                             │
  │ Document all findings with sources.                         │
  └─────────────────────────────────────────────────────────────┘
                              │
                              ▼
  ┌─────────────────────────────────────────────────────────────┐
  │ STEP B: PRESENT FINDINGS                                    │
  │                                                             │
  │ Show the user:                                              │
  │ - "## Research Round {N} Findings"                          │
  │ - List of techniques discovered                             │
  │ - Key insights from sources                                 │
  │ - Patterns from codebase exploration                        │
  │ - How this relates to their stated needs                    │
  └─────────────────────────────────────────────────────────────┘
                              │
                              ▼
  ┌─────────────────────────────────────────────────────────────┐
  │ STEP C: VALIDATE with AskUserQuestion                       │
  │                                                             │
  │ Ask:                                                        │
  │ 1. "What resonates with you from these findings?"           │
  │ 2. "What's missing or needs deeper exploration?"            │
  │ 3. "Should I research a specific technique more deeply?"    │
  │ 4. "Ready to proceed to technique selection, or another     │
  │     research round?"                                        │
  │                                                             │
  │ Options:                                                    │
  │ - "Ready to proceed" → Go to Phase 2                        │
  │ - "Research more on [topic]" → Refine and continue          │
  │ - "Add [technique] to consider" → Note and continue         │
  └─────────────────────────────────────────────────────────────┘
                              │
                              ▼
  IF user says "ready" OR round == 5:
      → Proceed to Phase 2
  ELSE:
      → Refine search based on feedback
      → Continue to next round
```

### Research Topics by Round (Suggestions)

| Round | Focus | Example Searches |
|-------|-------|------------------|
| 1 | Core techniques | "{domain} brainstorming techniques 2025" |
| 2 | Advanced methods | "{domain} structured ideation methods" |
| 3 | Cross-domain | "what can {domain} learn from design thinking" |
| 4 | AI-assisted | "LLM-assisted {domain} ideation patterns" |
| 5 | User-selected | Deep dive on topics user requested |

**DO NOT proceed to Phase 2 until user explicitly says "ready" or round 5 is complete.**

---

## Phase 2: Technique Curation

### Step 2.1: Present Technique Options

Based on research, present 5-8 relevant techniques:

```markdown
## Techniques for Your {Domain} Brainstorming Skill

Based on our research, here are the most relevant techniques:

### Divergent (Idea Generation)
1. **{Technique A}**: {Brief description}
   - Best for: {use case}
   - Time: {suggested duration}

2. **{Technique B}**: {Brief description}
   - Best for: {use case}
   - Time: {suggested duration}

### Convergent (Idea Refinement)
3. **{Technique C}**: {Brief description}
   - Best for: {use case}
   - Time: {suggested duration}

### Evaluation
4. **{Technique D}**: {Brief description}
   - Best for: {use case}
   - Time: {suggested duration}
```

**Use AskUserQuestion**:
```
Which techniques should I include in your skill? (Select 3-5)

Recommended combination:
- 1-2 divergent techniques (generate ideas)
- 1 convergent technique (cluster and refine)
- 1 evaluation technique (prioritize)

Would you like me to suggest a default combination, or would you prefer to pick manually?
```

### Step 2.2: Phase Structure Design

Propose the skill's phase structure:

```markdown
## Proposed Skill Structure

Based on your selections, here's the proposed flow:

### Phase 1: Frame & Understand (5 min suggested)
- Gather context about the problem
- Define scope and constraints
- Identify stakeholders

### Phase 2: Diverge - Generate Ideas (10-15 min suggested)
- Apply: {Selected Technique A}
- Apply: {Selected Technique B}
- Document all ideas without judgment

### Phase 3: Converge - Refine & Prioritize (10 min suggested)
- Apply: {Selected Technique C}
- Cluster similar ideas
- Prioritize based on {criteria}

### Phase 4: Synthesize - Document & Next Steps (5 min suggested)
- Save brainstorm results to file
- Identify action items
- Suggest follow-up commands
```

**Use AskUserQuestion**:
```
Does this phase structure work for your needs?

Options:
1. Yes, looks good
2. Adjust phases (tell me what to change)
3. Change time suggestions
4. Add/remove a phase
```

### Step 2.3: Output Format

**Use AskUserQuestion**:
```
How should the brainstorm output be saved?

Options:
1. ./brainstorm-outputs/{date}-{topic}.md (Recommended)
2. ./brainstorm-outputs/{domain}/{date}-{topic}.md (Organized by domain)
3. Custom path (you specify)
4. No file output (conversation only)
```

**DO NOT proceed to Phase 3 until user approves structure and output format.**

---

## Phase 3: Skill Generation

### Step 3.1: Generate SKILL.md

Create the skill file at `.claude/skills/brainstorm-{name}.md`:

```yaml
---
description: {Domain} brainstorming for {focus}. Use when {trigger keywords from user context}. Triggers: brainstorm, ideate, {domain} ideas, {domain} design session.
allowed-tools:
  - Read
  - Write
  - WebSearch
  - Glob
  - Grep
user-invocable: true
disable-model-invocation: false
---
```

**Skill Content Structure:**

```markdown
# {Domain} Brainstorming Skill

{Brief description based on user's stated needs}

## Quick Start

When to use this skill:
- {Use case 1 from user context}
- {Use case 2 from user context}
- {Use case 3 from user context}

---

## Phase 1: Frame & Understand

**Goal**: Establish clear context before ideation.

### Step 1.1: Context Gathering

**Use AskUserQuestion** to gather:

1. **Problem/Goal**: "What are you trying to solve or create?"
2. **Stakeholders**: "Who are the users/stakeholders affected?"
3. **Constraints**: "What limitations exist? (time, tech, budget)"
4. **Success Criteria**: "How will you know this brainstorm was successful?"

### Step 1.2: Document Problem Statement

Write a clear problem statement based on answers:

> **Problem**: {problem}
> **For**: {stakeholders}
> **Constraints**: {constraints}
> **Success looks like**: {criteria}

### Step 1.3: Validate Understanding

**Use AskUserQuestion**:
- "Does this problem statement capture your intent?"
- "Anything to add or clarify?"

**DO NOT proceed to Phase 2 until user confirms understanding.**

---

## Phase 2: Diverge - Generate Ideas

**Goal**: Generate as many ideas as possible without judgment.

**Time suggestion**: 10-15 minutes

### Step 2.1: Apply {Technique A}

{Detailed instructions for the technique}

### Step 2.2: Apply {Technique B}

{Detailed instructions for the technique}

### Step 2.3: Capture All Ideas

Document every idea, no matter how wild:

```markdown
## Raw Ideas

### From {Technique A}
1. {idea}
2. {idea}
...

### From {Technique B}
1. {idea}
2. {idea}
...
```

### Step 2.4: Expand the Pool

**Use AskUserQuestion**:
- "Any ideas to add that we haven't captured?"
- "What if we did the opposite of the obvious solution?"
- "How would {expert/company} approach this?"

**DO NOT proceed to Phase 3 until user confirms idea generation is complete.**

---

## Phase 3: Converge - Refine & Prioritize

**Goal**: Cluster, evaluate, and prioritize ideas.

**Time suggestion**: 10 minutes

### Step 3.1: Cluster Similar Ideas

Group ideas into themes:

```markdown
## Idea Clusters

### Theme A: {name}
- Idea 1
- Idea 3
- Idea 7

### Theme B: {name}
- Idea 2
- Idea 5

...
```

### Step 3.2: Apply Evaluation Criteria

For each cluster/idea, evaluate:

| Idea/Theme | Feasibility | Impact | Effort | Score |
|------------|-------------|--------|--------|-------|
| {idea} | High/Med/Low | High/Med/Low | High/Med/Low | {H/M/L} |

### Step 3.3: Create Priority Shortlist

Select top 3-5 ideas based on evaluation.

### Step 3.4: Validate Priorities

**Use AskUserQuestion**:
- "Do these priorities align with your goals?"
- "Should we adjust the ranking?"
- "Any idea we should reconsider?"

**DO NOT proceed to Phase 4 until user approves priorities.**

---

## Phase 4: Synthesize - Document & Next Steps

**Goal**: Capture results and identify actions.

**Time suggestion**: 5 minutes

### Step 4.1: Write Output File

Save to: `./brainstorm-outputs/{date}-{topic}.md`

Use the template from `.claude/templates/brainstorm-output-template.md`

### Step 4.2: Identify Action Items

For each priority idea:
- What's the immediate next step?
- Who needs to be involved?
- What's the timeline?

### Step 4.3: Suggest Follow-up

**Use AskUserQuestion**:
```
Brainstorm complete! Your results are saved to {output_path}.

What would you like to do next?

Options:
1. Run /create-spec for the top idea
2. Start another brainstorm session
3. Review and refine the output
4. Done for now
```

---

## Technique Reference

### {Technique A}
{Detailed description}
{Step-by-step instructions}
{Example}

### {Technique B}
{Detailed description}
{Step-by-step instructions}
{Example}

...
```

### Step 3.2: Write the File

Use the Write tool to create the skill file.

### Step 3.3: Present & Validate

Show the generated skill content to the user:

```
## Skill Generated

**File**: .claude/skills/brainstorm-{name}.md

### Summary
- Phases: 4 (Frame → Diverge → Converge → Synthesize)
- Techniques: {list}
- Output: {path}
- Triggers: {keywords}

Would you like to:
1. Review the full content
2. Make adjustments
3. Test the skill now
```

---

## Phase 4: Documentation & Testing

### Step 4.1: Offer Test Run

**Use AskUserQuestion**:
```
Would you like to test your new brainstorming skill now?

Options:
1. Yes, let's do a test brainstorm
2. No, I'll test it later
3. Show me how to invoke it first
```

If user chooses to test:
- Invoke the newly created skill
- Walk through all phases
- Gather feedback for refinements

### Step 4.2: Suggest Iterations

After testing or if user declines:

```
## Your Brainstorming Skill is Ready!

**Invoke with**: Just ask Claude to brainstorm {domain} topics, or use trigger keywords.

**Tips for best results**:
- Allow enough time for each phase
- Don't skip the Frame phase - context is crucial
- Wild ideas in Diverge phase often lead to best solutions
- Priorities in Converge phase should align with your constraints

**After using a few times, consider**:
- Adjusting time suggestions based on your experience
- Adding techniques that work well for your team
- Creating specialized variants for specific use cases
```

---

## Error Handling

### User Wants to Skip Research
If user says "skip research" or similar:
- Warn: "Research helps tailor the skill to your needs. Are you sure?"
- If confirmed, use default techniques for the domain
- Proceed to Phase 2

### Unknown Domain
If domain is "custom" or unrecognized:
- Conduct extra research round focused on user's description
- Ask clarifying questions about the problem space
- Build technique list from research findings

### Skill Already Exists
If `.claude/skills/brainstorm-{name}.md` exists:
- Ask: "A skill with this name exists. Should I: (A) Overwrite, (B) Create with new name, (C) Cancel?"

---

## Quick Reference

### Technique Library by Domain

**Generic**: SCAMPER, Mind Mapping, How Might We, Reverse Brainstorming, 6-3-5 Brainwriting, Starbursting

**Product/UX**: Design Thinking, User Story Mapping, Opportunity Solution Tree, Jobs-to-be-Done, Empathy Mapping, Journey Mapping

**UI/Design**: Crazy Eights, Moodboarding, Design Studio, Style Tiles, UI Inventory, Competitive Analysis

**API Contract**: Schema-first Design, Request/Response Mapping, Error Scenario Mapping, Versioning Strategy, Contract Testing Ideation

**API Architecture**: Event Storming, ADR Framework, Domain Discovery, Bounded Context Mapping, Aggregate Design

**Frontend**: Atomic Design, State Mapping, Component Composition, Accessibility-first Design, Performance Budgeting

**Full-Stack**: C4 Model, Trade-off Analysis, Integration Mapping, Data Flow Diagramming, Deployment Strategy

### Output Path Convention
```
./brainstorm-outputs/{YYYY-MM-DD}-{topic-in-kebab-case}.md
```

### Skill File Location
```
.claude/skills/brainstorm-{domain}.md
```
