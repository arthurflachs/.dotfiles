---
name: create-scenarios
description: "Create scenarios and use cases for a Skepsi feature that already has a spec. Follows a structured workflow: confirm spec understanding, identify personas, design screen states, then write flow scenarios (concrete user journeys across multiple screens). Iterative — scenarios can reveal gaps in screen states. Use when user asks to 'create scenarios', 'write scenarios', 'define use cases', 'scenario planning', 'create states', or mentions working on scenarios for a feature."
allowed-tools:
  - Read
  - Write
  - Edit
  - Glob
  - Grep
  - AskUserQuestion
  - Task
user-invocable: true
disable-model-invocation: false
---

# Create Scenarios

Structured workflow for creating screen states and flow scenarios for a Skepsi feature.

## Two Artifacts

This skill produces two distinct but connected artifacts:

1. **State files** (`states/*.yaml`) — Screen snapshots. What a specific screen looks like with concrete data. One file per screen. See [yaml-format.md](reference/yaml-format.md).

2. **Flow scenarios** (`scenarios/*.yaml`) — A persona's journey *across* multiple screens with specific data that stays consistent throughout. "Mme Dupont types this exercise, clicks assign, sees this confirmation." See [scenario-format.md](reference/scenario-format.md).

**Relationship**: State files define what each screen CAN show. Flow scenarios define a specific path through those screens with concrete, consistent data. One flow scenario touches multiple state files. The same state file can appear in multiple flow scenarios with different data.

**Ordering**: State files first (design screens), then flow scenarios (walk through them). But the process is iterative — writing a flow scenario may reveal missing states, inconsistent data, or broken transitions. When that happens, update the state files.

## File Layout

```
founder/features-development/{feature}/
├── spec.md                          # Feature spec (input, already exists)
├── research/                        # Research docs (input, may exist)
├── states/                          # Screen state files
│   ├── {screen-a}.yaml
│   └── {screen-b}.yaml
└── scenarios/                       # Flow scenarios
    ├── {persona-action}.yaml
    └── {persona-action}.yaml
```

## Workflow

```
Read Spec → Confirm Understanding → Identify Personas → Validate Personas
                                                              │
                    ┌─────────────────────────────────────────┘
                    ▼
             Brainstorm & Validate Screen List
                    │
                    ▼
             For Each Screen:
               → Design state file
               → Present for validation
               → Write
                    │
                    ▼
             Brainstorm & Validate Flow Scenario List
                    │
                    ▼
             For Each Flow Scenario:
               → Write concrete journey across screens
               → Present for validation
               → If gaps found → update state files
               → Write
                    │
                    ▼
             Suggest Next Steps
```

**CRITICAL**: Never skip user checkpoints. Every phase requires explicit validation.

## Phase 1: Confirm Understanding

1. **Read the spec**: `founder/features-development/{feature}/spec.md`
2. **Read any existing states**: `founder/features-development/{feature}/states/*.yaml`
3. **Read any existing scenarios**: `founder/features-development/{feature}/scenarios/*.yaml`
4. **Read any research**: `founder/features-development/{feature}/research/*`
5. **Present a summary**:

```
Feature: {name}
Core idea: {1 sentence}
User flow: {numbered steps}
Key screens: {list}
Design principles: {from spec}
```

6. **Ask**: "Is my understanding correct? Anything I'm missing or misreading?"

Do NOT proceed until user confirms.

## Phase 2: Identify Personas

1. **Check existing personas** across all features:
   - Read `founder/features-development/*/states/*.yaml` and `*/scenarios/*.yaml`
   - Check [persona catalog](reference/personas.md) for the known list

2. **Brainstorm personas** relevant to this feature:
   - Who uses this feature? What are their different motivations, skill levels, contexts?
   - Teacher features: new vs experienced, tech-savvy vs reluctant, small vs large class
   - Student features: rusher, struggler, guesser (established), plus feature-specific variations
   - Edge cases: what unusual but realistic persona would stress-test this feature?

3. **Present personas**:

| Persona | Description | Why they matter for this feature |
|---------|-------------|----------------------------------|
| {name}  | {1-2 sentences} | {what this persona tests/reveals} |

Mark reused personas with "(existing)" and new ones with "(new)".

4. **Ask**: "Do these personas cover the right ground? Any to add, remove, or adjust?"

Do NOT proceed until user validates.

## Phase 3: Design Screen States

### 3a: Brainstorm screens

From the spec's user flow, identify the screens needed:

| # | Screen | State file | Description | Variants |
|---|--------|------------|-------------|----------|
| 1 | {name} | {file}.yaml | {what this screen shows} | {count} |

**Ask**: "Does this screen list cover the feature? Any missing or unnecessary?"

### 3b: Write state files (one at a time)

For each screen, in order:

1. **Write the state file** following [yaml-format.md](reference/yaml-format.md)
2. **Present for validation** in human-readable format:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SCREEN: {screen name}
File: states/{filename}.yaml
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Description: {what the user sees}

DATA:
  Teacher: Mme Dupont
  Class: 6eme A (25 students)
  Exercise: "Fractions — Complement a 1"
  ...

ELEMENTS:
  Header: "Creer un exercice" with class selector
  Form: subject dropdown (Mathematiques selected), grade (6eme), topic (Fractions)
  Text area: exercise content, empty, placeholder "Collez ou tapez votre exercice..."
  Import buttons: PDF, Google Classroom, Pronote (grayed), Ecole Directe (grayed)
  ...

VARIANTS (if any):
  1. {id} — {concrete difference}

INTERACTIONS:
  - Paste exercise text → auto-breakdown appears → form-filled.yaml
  - Click "Importer un PDF" → import modal opens → import-modal.yaml#pdf
  ...
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**Key rule**: Use concrete data, not descriptions. Write the actual text, labels, and values a user would see — not "a form with relevant fields."

3. **Ask**: "How does this screen look? Ready to write, or adjustments needed?"
4. **Write** the YAML file and move to next screen.

## Phase 4: Write Flow Scenarios

### 4a: Brainstorm flow scenarios

For each persona, brainstorm journeys through the screens:

| # | Scenario | Persona | Screens touched | What it tests |
|---|----------|---------|-----------------|---------------|
| 1 | {name}   | {who}   | {screen list}   | {what this journey reveals} |

Consider:
- Happy paths (smooth flow through the feature)
- Friction paths (errors, edge cases, unusual inputs)
- Cross-feature paths (arriving from or leaving to another feature)

**Ask**: "Which flow scenarios should we write? Any to add, merge, or reorder?"

### 4b: Write flow scenarios (one at a time)

For each scenario:

1. **Write the flow scenario** following [scenario-format.md](reference/scenario-format.md)
2. **Present for validation** in human-readable format:

```
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
FLOW: {scenario name}
File: scenarios/{filename}.yaml
Persona: {who}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Context: {why this persona is doing this, what they need}

STEP 1: {screen name} (states/{file}.yaml)
  The teacher sees: {what's on screen}
  Action: {exactly what they do — specific text they type, button they click}
  Result: {what changes on screen}

STEP 2: {screen name} (states/{file}.yaml)
  The teacher sees: {what's on screen, with data from step 1}
  Action: {what they do next}
  Result: {what happens}

...

OUTCOME: {end state — what the persona accomplished}

STATE FILE ISSUES FOUND:
  - {any inconsistencies, missing data, or gaps discovered}
  - (or "None")
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

**Key rules**:
- Every piece of data must be **specific**: the actual exercise text, the actual class name, the actual date
- Data must be **consistent** across steps: if Mme Dupont typed "Completer: 1/3 + ? = 1" in step 1, step 3 shows that same text
- Steps reference **specific state files** — this is how scenarios connect to screens

3. **Check for state file issues**: While writing, if the scenario reveals:
   - A screen transition that no state file covers → flag it
   - Data that should appear on a screen but isn't in the state file → flag it
   - An interaction that's missing from a state file → flag it

   Present issues in the "STATE FILE ISSUES FOUND" section. After user validates the scenario, go update the affected state files before moving on.

4. **Ask**: "How does this flow look? Any steps missing or wrong?"
5. **Write** the YAML file. If state files need updates, update those too.

## Phase 5: Suggest Next Steps

After all scenarios are written:

1. **Summarize**:
   - State files written/updated
   - Flow scenarios written
   - Any state file issues fixed during the process

2. **Suggest next steps**:
   - Missing scenarios that emerged during the process
   - Research needed
   - Spec updates suggested by scenario work
   - Related features that need scenarios

3. **Ask**: "What would you like to tackle next?"

## References

- [YAML Format](reference/yaml-format.md) — state file structure
- [Scenario Format](reference/scenario-format.md) — flow scenario structure
- [Persona Catalog](reference/personas.md) — established personas
